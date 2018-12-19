#' Calculation of each species' temperature-mass relationship r^2
#' 
#' Takes annual masses and corresponding temperatures for all species, runs
#' linear regression on relationship for each species, and extracts r^2
#' 
#' @param mass_df dataframe containing all annual masses and temperatures for all species
#' 
#' @return dataframe with species and r^2 columns
#' 
#' @examples 
#' df = data.frame(species = c("A", "A", "A"), yr = c(1990, 1991, 1992), avg_temp = c(14, 12, 10), mass_mean = c(21, 23, 25))
#' regression_mrt_r2(df)
#' 
#' @export
#' @import dplyr
#' @import tidyr
#' @import broom
#' @import purrr

regression_mrt_r2 = function(mass_df){
  regression_df = mass_df %>% 
    nest(-species) %>%
    mutate(fit = map(data, ~lm(mass_mean ~ avg_temp, data = .)),
           results = map(fit, glance)) %>%
    unnest(results) %>%
    select(species, r.squared)
  return(regression_df)
}