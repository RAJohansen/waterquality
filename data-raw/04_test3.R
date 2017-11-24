xx = function(..., alg){
  do.call(alg, as.list(...))
}


alg = Al10SABI

Al10SABI(s2[[9]], s2[[4]], s2[[2]], s2[[3]])

xx(s2[[9]], s2[[4]], s2[[2]], s2[[3]], alg = Al10SABI)
xx(s2[[9]], s2[[4]], s2[[2]], s2[[3]], alg = "Al10SABI")
xx(s2[[c(9, 4, 2, 3)]], alg = "Al10SABI")

       