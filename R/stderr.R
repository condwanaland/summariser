#' std_error
#'
#' Function to calculate standard errors. Can be used on a vector, but primarily used internally for `summary_stats`
#'
#' @param x A vector of numeric values
#'
#' @return Numeric vector of length one
#' @noRd
#'
#' @examples
#' vec <- c(2, 3, 4, 5)
#' std_error(vec)
#'
#' library(dplyr)
#' data(iris)
#' summarise(iris, petal_stderr = std_error(Petal.Length))

std_error <- function(x){

  if (length(x) < 3){
    stop("There must be at least three observations to compute a standard error")
  }

  if (!inherits(x, "numeric")){
    stop("Input must be numeric")
  }

  sd(x, na.rm = TRUE)/sqrt(length(na.omit(x)))
}
