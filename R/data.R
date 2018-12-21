#' Example dataset for testing mass data thresholding function
#' 
#' This is a made up set of data for three species at two sites to ensure the
#' threshold_mass function is working properly. 
#' 
#' @format A data frame with 48 rows and 5 variables:
#' \describe{
#' \item{species}{species classification for individual}
#' \item{inds}{number of individuals of that species in dataset}
#' \item{yr}{year that individual was collected}
#' \item{site}{site where that individual was collected}
#' \item{avg_temp}{mean temperature for the year that the individual was collected}
#' }
"threshold_mass_data"