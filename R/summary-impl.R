#' summary_impl
#'
#'  Implementation of the actual summary statistics
#'
#' @param dat
#' @param measure_var
#'
#' @return
#' @noRd
#'

summary_impl <- function(dat, measure_var){
  dat <- summarise(dat,
                   mean = mean(!!measure_var),
                   sd = sd(!!measure_var),
                   n = length(!!measure_var),
                   se = std_error(!!measure_var),
                   ci = std_error(!!measure_var) * qnorm(0.975))
  return(dat)
}
