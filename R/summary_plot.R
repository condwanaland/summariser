#' @title summary_plot
#' @description the output of a \code{summary_stats} call is input into a
#'  \code{summary_plot} call to produce a graph of the calculated means and
#'  confidence intervals.
#'
#' @param data a data frame produced by \code{summary_stats}
#' @param x a factor variable to plot on the x axis
#' @param colour a factor variable to colour points by
#'
#'
#' @export
#'
#'
#' @examples data(iris)
#' sum1 <- summary_stats(iris, measure = "Sepal.Length", Species)
#' summary_plot(sum1, x="Species", colour="Species")


summary_plot<-function(data, x, colour=NULL){
  ggplot(data, aes_string(x, "mean", colour=colour)) + geom_point() +
    geom_errorbar(aes(ymin=data$mean-data$ci, ymax=data$mean+data$ci))
}


