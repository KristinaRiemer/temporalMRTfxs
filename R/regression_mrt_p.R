#' Calculation of each species' temperature-mass relationship p-value and slope
#' 
#' Takes annual masses and corresponding temperatures for all species, runs
#' linear regression on relationship for each species, and extracts p-value
#' and slope
#' 
#' @param mass_df dataframe containing all annual masses and temperatures for all species
#' 
#' @return dataframe with species, slope, and p-value columns
#' 
#' @examples 
#' df = data.frame(species = c("A", "A", "A"), yr = c(1990, 1991, 1992), avg_temp = c(10, 12, 14), mass_mean = c(21, 23, 25))
#' regression_mrt_p(df)
#' 
#' @export
#' @import dplyr
#' @import tidyr
#' @import broom
#' @import purrr

regression_mrt_p = function(mass_df){
  regression_df = mass_df %>% 
    nest(-species) %>% 
    mutate(fit = map(data, ~lm(mass_mean ~ avg_temp, data = .)), 
           results = map(fit, tidy)) %>% 
    unnest(results) %>% 
    filter(term == "avg_temp") %>% 
    select(species, slope = estimate, p.value)
  return(regression_df)
}
