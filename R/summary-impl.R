#' summary_impl
#'
#' Implementation of the actual summary statistics
#'
#' @param dat A dataframe
#' @param measure_var Column of dat that contains the variable to calculate statistics for
#'
#' @return A dataframe
#' @noRd

summary_impl <- function(dat, measure_var, type){

  if (missing(type)){
    type <- "norm"
  }

  if (type == "t"){
    dat <- dplyr::summarise(dat,
                            mean = mean(!!measure_var),
                            sd = stats::sd(!!measure_var),
                            n = length(!!measure_var),
                            se = std_error(!!measure_var),
                            ci = std_error(!!measure_var) * stats::qt(0.975, df=dplyr::n-1))
  }
  else{
    dat <- dplyr::summarise(dat,
                            mean = mean(!!measure_var),
                            sd = stats::sd(!!measure_var),
                            n = length(!!measure_var),
                            se = std_error(!!measure_var),
                            ci = std_error(!!measure_var) * stats::qnorm(0.975))
  }

  return(dat)
}
