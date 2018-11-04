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
#' @param ... a factor variable, or group of factor variables.  Data frame
#'   will be grouped by this variable, and summary statistics will be produced
#'   for each group
#' @export
#' @import ggplot2
#' @import dplyr
#' @import plotrix
#' @import lazyeval
#' @examples data(iris)
#'   summary_stats(iris, measure = "Sepal.Length")
#'   summary_stats(iris, measure = "Sepal.Length", Species)

summary_stats <- function(data, measure, ...){
  UseMethod("summary_stats")
}


#' @export
summary_stats.default <- function(data, measure, ...){
  stop("Sorry, summary_stats only provides methods for class 'data.frame' and 'grouped_df'")
}


#' @export
summary_stats.data.frame <- function(data, measure, ...){
  group_var <- quos(...)
  measure_var <- enquo(measure)

  dat <- group_by(data, !!!group_var)

  dat <- summary_impl(dat, measure_var)

  return(dat)
}


#' @export
summary_stats.grouped_df <- function(data, measure){
  measure_var <- enquo(measure)

  dat <- summary_impl(data, measure_var)

  return(dat)
}
