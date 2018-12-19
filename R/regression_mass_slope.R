#' Calculation of each species' annual mass slope
#' 
#' Takes annual masses for all species, runs linear regression on all annual
#' masses for each species, and extracts slope
#' 
#' @param mass_df dataframe containing all annual masses for all species
#' 
#' @return dataframe with species and slope columns
#' 
#' @examples 
#' df = data.frame(species = c("A", "A", "A"), yr = c(1990, 1991, 1992), mass_mean = c(21, 23, 25))
#' regression_mass_slope(df)
#' 
#' @export
#' @import dplyr
#' @import tidyr
#' @import broom
#' @import purrr

regression_mass_slope = function(mass_df){
  regression_df = mass_df %>% 
    nest(-species) %>% 
    mutate(fit = map(data, ~lm(mass_mean ~ yr, data = .)), 
           results = map(fit, tidy)) %>% 
    unnest(results) %>% 
    filter(term == "yr") %>% 
    select(species, slope = estimate)
  return(regression_df)
}