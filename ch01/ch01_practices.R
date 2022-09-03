# [4](a)
# function to solve quadratic quations
# return conditional expression and answers of equations
solve_quadratic_eqs <- function(a, b, c){
  d = b^2 - 4 * a * c
  rat = - b / (2 * a)
  irrat = sqrt(abs(d)) / 2 * a
  
  if(d > 0) {
    ans = c(rat + round(irrat, 3), rat - round(irrat, 3))
  } else if(d == 0) {
    ans = rat
  } else {
    ans = c(complex(real = rat, imaginary = round(irrat, 3)),
            complex(real = rat, imaginary = -round(irrat, 3)))
  }
  
  return(list(d = d, ans = ans))
}

# [4](b)
# function to plot impulse functions
library(ggplot2)

plot_unit_shock <- function(b, c) {
  n = 25
  init = 0
  shock <- 1
  
  ans <- c(init, init)
  for(i in 1:n) {
    if(i == 1) {
      yt <- b * ans[length(ans)] + c * ans[length(ans)-1] + shock
    } else {
      yt <- b * ans[length(ans)] + c * ans[length(ans)-1]
    }
    ans <- append(ans, yt)
  }
  
  ans <- ans[3:length(ans)]
  ans <- data.frame(
    time = 1:n,
    yt = ans
  )
  
  g <- ggplot(ans, aes(x = time, y = yt)) + 
    geom_line()
  plot(g)
}
