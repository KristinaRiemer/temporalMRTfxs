#' Generate thresholded mass dataset
#' 
#' Subset mass dataset to include only those species with a chosen minimum of
#' individuals and individuals from a chosen minimum of different years
#' 
#' @param full_mass_df entire mass dataset
#' @param min_inds desired minimum number of individuals
#' @param min_yrs desired minimum number of years
#' 
#' @return thresholded mass dataset with species, inds, yr, site, avg_temp,
#' and num_yrs columns
#' 
#' @examples 
#' threshold_mass(threshold_mass_data)
#' 
#' @export
#' @import dplyr

threshold_mass = function(full_mass_df, min_inds = 15, min_yrs = 5){
  subset_mass_df = full_mass_df %>% 
    filter(!is.na(avg_temp)) %>% 
    filter(inds >= min_inds) %>% 
    group_by(site, species) %>% 
    mutate(num_yrs = n_distinct(yr)) %>% 
    ungroup() %>% 
    filter(num_yrs >= min_yrs)
  return(subset_mass_df)
}
