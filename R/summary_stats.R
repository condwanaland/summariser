#' @title Calculate summary statistics on a data frame
#' @description Functions from dplyr are used to automate the process of
#'  calculating basic summary statistics on a data frame. Returned
#'  statistics include mean, standard deviation, standard error, count,
#'  and 95% confidence intervals. Functions are given for calculating
#'  confidence intervals from a normal distribution (summary_stats) and
#'  from a t-distribution (summary_stats.t)
#'
#' @param data a data frame
#' @param measure a numeric variable. Response variable - summary statistics
#'   will be returned for this variable
#' @param type a string variable. Controls whether a normal or t distribution is used for CI
#'   calculation. Defaults to "norm".

#' @export
#' @examples
#' library(summariser)
#' library(dplyr)
#' iris %>%
#'   summary_stats(Sepal.Length)
summary_stats <- function(data, measure, type){
  UseMethod("summary_stats")
}


#' @export
summary_stats.default <- function(data, measure, type){
  print("Sorry, summary_stats only provides methods for class 'data.frame' and 'grouped_df'")
}


#' @export
summary_stats.data.frame <- function(data, measure, type){
  measure_var <- dplyr::enquo(measure)

  dat <- summary_impl(data, measure_var, type)

  return(dat)
}
