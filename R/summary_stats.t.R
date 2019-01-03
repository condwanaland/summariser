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
#' @examples
#' \dontrun{
#' data(iris)
#'   summary_stats.t(iris, measure = "Sepal.Length")
#'   summary_stats.t(iris, measure = "Sepal.Length", Species)
#'   }


summary_stats.t <- function(data, measure, ...) {
  data %>% group_by_(.dots = lazyeval::lazy_dots(...)) %>%
    summarise_(mean = interp(~mean(x), x= as.name(measure)),
               sd = interp(~sd(x), x = as.name(measure)),
               N = interp(~length(x), x = as.name(measure)),
               se = interp(~plotrix::std.error(x), x=as.name(measure)),
               ci = interp(~plotrix::std.error(x)*qt(0.975, df=N-1), x=as.name(measure)))
}
