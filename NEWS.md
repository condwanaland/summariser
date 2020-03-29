# summariser 2.1.0

* Maintainece release to make tests compliant with new `dplyr` version

# summariser 2.0.0

* summariser underwent a major rewrite with version 2. It now fits in better with the piping
and function verb style of the tidyverse. See the updated readme to see how it now works. 

* `summary_stats.t` has been removed in favor of the `type` argument in `summary_stats`.

* `summary_plot` has been removed. It never really worked, and was incompatible with the 
ggplot2 API. 

# summariser 0.1.0.9001

* Added a `NEWS.md` file to track changes to the package.

* Rewrote the basic `summary_stats_` functions to use the lazy evaluation system implemented in dplyr v0.7.
