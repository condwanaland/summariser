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


summary_stats <- function(data, measure, ...) {
  data %>% group_by_(.dots = lazyeval::lazy_dots(...)) %>%
    summarise_(mean = interp(~mean(x), x= as.name(measure)),
               sd = interp(~sd(x), x = as.name(measure)),
               N = interp(~length(x), x = as.name(measure)),
               se = interp(~plotrix::std.error(x), x=as.name(measure)),
               ci = interp(~plotrix::std.error(x)*qnorm(0.975), x=as.name(measure)))
}


summary_stats_new <- function(data, measure, ...){
  group_var <- quos(...)
  measure_var <- enquo(measure)

  dat <- group_by(data, !!!group_var)
  dat <- summarise(dat,
                   mean = mean(!!measure_var),
                   sd = sd(!!measure_var),
                   n = length(!!measure_var),
                   se = plotrix::std.error(!!measure_var),
                   ci = plotrix::std.error(!!measure_var) * qnorm(0.975))
  return(dat)
}



summary_stats_new(juvenile_morphologies, standard_length, month, age_class)
