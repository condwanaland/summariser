#' std_error
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

  if (class(x) != "numeric"){
    stop("Input must be numeric")
  }

  sd(x, na.rm = TRUE)/sqrt(length(na.omit(x)))
}
