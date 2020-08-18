#' Run linear model (lm)
#'
#'The function runs a linear model on a single independent and dependent variable
#' and returns a data frame containing the following:
#' r^2, p-value, slope, and intercept of the model
#'
#' @param parameter dependent variable
#' @param algorithm independent variable
#' @param df data frame containing the values for parameter and algorithm arguments
#' @return A data frame of the model results
#'
#' @references Johansen, Richard; et al. (2018). Evaluating the portability of satellite derived chlorophyll-a algorithms for temperate inland lakes using airborne hyperspectral imagery and dense surface observations. Harmful Algae. 76. 10.1016/j.hal.2018.05.001.
#' @references  R Core Team (2018). R: A language and environment for statistical computing. R Foundation for Statistical Computing, Vienna, Austria. URL https://www.R-project.org/.
#'
#' @family extract_lm
#' @export
extract_lm <- function(parameter, algorithm, df){
  my_lm = lm(parameter ~ algorithm)
  R_Squared = summary(my_lm)$r.squared
  P_Value = summary(my_lm)$coefficients[8]
  Slope = summary(my_lm)$coefficients[2]
  Intercept = summary(my_lm)$coefficients[1]
  vctrs::data_frame(R_Squared = R_Squared, Slope = Slope, 
                    Intercept = Intercept, P_Value = P_Value)
}

#' Run linear model with crossvalidation
#'
#'The function runs a linear model on a single independent and dependent variable and conducts
#' a k-folds cross validation, which returns a data frame containing the following:
#' The r^2, p-value, slope, intercept of the global lm model &
#' average r^2, average RMSE, average MAE from the crossvalidated model 
#'
#' @param parameter dependent variable
#' @param algorithm independent variable
#' @param df data frame containing the values for parameter and algorithm arguments
#' @param folds the number of folds to be used in the cross validation model
#' @param nrepeats the number of iterations to be used in the cross validation model
#'
#' @return A data frame of the model results
#'
#' @references Johansen, Richard; et al. (2018). Evaluating the portability of satellite derived chlorophyll-a algorithms for temperate inland lakes using airborne hyperspectral imagery and dense surface observations. Harmful Algae. 76. 10.1016/j.hal.2018.05.001.
#' @references  R Core Team (2018). R: A language and environment for statistical computing. R Foundation for Statistical Computing, Vienna, Austria. URL https://www.R-project.org/.
#' @references   Max Kuhn. Contributions from Jed Wing, Steve Weston, Andre Williams, Chris Keefer, Allan Engelhardt, Tony Cooper, Zachary Mayer, Brenton Kenkel, the R Core Team, Michael Benesty, Reynald Lescarbeau, Andrew Ziem, Luca Scrucca, Yuan Tang, Can Candan and Tyler Hunt. (2018). caret: Classification and Regression Training. R package version 6.0-81. https://CRAN.R-project.org/package=caret
#'
#' @family extract_lm
#' @export
#' 
#' @importFrom stats lm as.formula na.exclude 
#' @importFrom caret trainControl train getTrainPerf
#' 
extract_lm_cv <- function(parameter, algorithm, df, folds = 3, nrepeats =5){
  if (!requireNamespace("caret", quietly = TRUE))
    stop("package caret required, please install it first") 
  my_formula = as.formula(paste(parameter, "~" ,algorithm))
  caret_model = caret::train(form = my_formula,
                             data = df,
                             method = "lm",
                             na.action = na.exclude,
                             #repeated k-fold validation
                             trControl = caret::trainControl(method = "repeatedcv",
                                                             number = folds, repeats = nrepeats))
  my_lm = caret_model$finalModel
  CV_R_Squared = caret::getTrainPerf(caret_model)[, "TrainRsquared"]
  RMSE = caret::getTrainPerf(caret_model)[, "TrainRMSE"]
  MAE = caret::getTrainPerf(caret_model)[, "TrainMAE"]
  R_Squared = summary(my_lm)$r.squared
  P_Value = summary(my_lm)$coefficients[8]
  Slope = summary(my_lm)$coefficients[2]
  Intercept = summary(my_lm)$coefficients[1]
  vctrs::data_frame(R_Squared = R_Squared, Slope = Slope, Intercept = Intercept, 
                    P_Value = P_Value, CV_R_Squared = CV_R_Squared, RMSE = RMSE, MAE = MAE)
}

#' Run linear model with crossvalidation over multiple independent and dependent variables
#'
#'The function runs a linear model on a list of x and list of y variables and conducts
#' a k-folds cross validation, which returns a data frame containing the following:
#' The r^2, p-value, slope, intercept of the global lm model &
#' average r^2, average RMSE, average MAE from the crossvalidated model
#'
#' @param parameter the list of dependent variables to be evaluated
#' @param algorithm the list of independent variables to be evaluated
#' @param df data frame containing the values for parameter and algorithm arguments
#' @param folds the number of folds to be used in the cross validation model
#' @param nrepeats the number of iterations to be used in the cross validation model
#'
#' @return A data frame of the model results
#'
#' @references Johansen, Richard; et al. (2018). Evaluating the portability of satellite derived chlorophyll-a algorithms for temperate inland lakes using airborne hyperspectral imagery and dense surface observations. Harmful Algae. 76. 10.1016/j.hal.2018.05.001.
#' @references  R Core Team (2018). R: A language and environment for statistical computing. R Foundation for Statistical Computing, Vienna, Austria. URL https://www.R-project.org/.
#' @references   Max Kuhn. Contributions from Jed Wing, Steve Weston, Andre Williams, Chris Keefer, Allan Engelhardt, Tony Cooper, Zachary Mayer, Brenton Kenkel, the R Core Team, Michael Benesty, Reynald Lescarbeau, Andrew Ziem, Luca Scrucca, Yuan Tang, Can Candan and Tyler Hunt. (2018). caret: Classification and Regression Training. R package version 6.0-81. https://CRAN.R-project.org/package=caret
#'
#' @family extract_lm
#' @export
#' 
#' @importFrom purrr map_chr map_dfr
#' 
extract_lm_cv_multi <- function(parameter, algorithm, df,folds = 3, nrepeats = 5){
  if (!requireNamespace("caret", quietly = TRUE))
    stop("package caret required, please install it first") 
  list = list()
  for (i in seq_along(parameter)) {
    names(algorithm) <- algorithm %>% 
      purrr::map_chr(., ~ paste0(parameter[[i]], "_",.))
    list[[i]] = algorithm %>%
      purrr::map_dfr(~extract_lm_cv(y = parameter[[i]], algorithm = ., df = df, 
                                    folds = folds, nrepeats = nrepeats), .id = "Algorithms")
  }
  results <- (do.call(rbind, list))
  assign(paste0(format(Sys.time(), "Results_%Y-%m-%d_%H%M")), results, envir = .GlobalEnv)
}


#' Run linear model with crossvalidation over multiple dependent and all numeric independent variables in a data frame
#'
#'The function runs a linear model on a list of x and list of y variables and conducts
#' a k-folds cross validation, which returns a data frame containing the following:
#' The r^2, p-value, slope, intercept of the global lm model &
#' average r^2, average RMSE, average MAE from the crossvalidated model
#'
#' @param parameter the list of dependent variables to be evaluated
#' @param df data frame containing the values for parameter and algorithm arguments
#' @param folds the number of folds to be used in the cross validation model
#' @param nrepeats the number of iterations to be used in the cross validation model
#'
#' @return A data frame of the model results
#'
#' @references Johansen, Richard; et al. (2018). Evaluating the portability of satellite derived chlorophyll-a algorithms for temperate inland lakes using airborne hyperspectral imagery and dense surface observations. Harmful Algae. 76. 10.1016/j.hal.2018.05.001.
#' @references  R Core Team (2018). R: A language and environment for statistical computing. R Foundation for Statistical Computing, Vienna, Austria. URL https://www.R-project.org/.
#' @references   Max Kuhn. Contributions from Jed Wing, Steve Weston, Andre Williams, Chris Keefer, Allan Engelhardt, Tony Cooper, Zachary Mayer, Brenton Kenkel, the R Core Team, Michael Benesty, Reynald Lescarbeau, Andrew Ziem, Luca Scrucca, Yuan Tang, Can Candan and Tyler Hunt. (2018). caret: Classification and Regression Training. R package version 6.0-81. https://CRAN.R-project.org/package=caret
#'
#' @family extract_lm
#' @export
#' 
#' @importFrom purrr map_chr map_dfr
#' 
extract_lm_cv_all <- function(parameter, df, folds = 3, nrepeats = 5){
  if (!requireNamespace("caret", quietly = TRUE))
    stop("package caret required, please install it first") 
  list = list()
  for (i in seq_along(parameter)) {
    algorithm = df %>%
      dplyr::select(which(sapply(., class) == "numeric"), -parameter) %>%
      names()
    names(algorithm) <- algorithm %>%
      purrr::map_chr(., ~ paste0(parameter[[i]], "_", .))
    list[[i]] = algorithm %>%
      purrr::map_dfr(~extract_lm_cv(y = parameter[[i]], algorithms = ., df = df, 
                                    folds = folds, nrepeats = nrepeats), .id = "Algorithms")
  }
  results <- (do.call(rbind, list))
  assign(paste0(format(Sys.time(), "Results_%Y-%m-%d_%H%M")), results, envir = .GlobalEnv)
}
