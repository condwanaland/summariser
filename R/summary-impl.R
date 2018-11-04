summary_impl <- function(dat, measure_var){
  dat <- summarise(dat,
                   mean = mean(!!measure_var),
                   sd = sd(!!measure_var),
                   n = length(!!measure_var),
                   se = std_error(!!measure_var))
  return(dat)
}


summary_ci
