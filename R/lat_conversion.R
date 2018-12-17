#' Conversion of latitudinal coordinates to grid format
#' 
#' Takes latitudinal coordinates and uses proper math formula to get grid values
#' 
#' @param coord_lat latitudinal coordinates
#' 
#' @return single numeric value
#' 
#' @examples 
#' lat_conversion(20)
#' 
#' @export

lat_conversion = function(coord_lat){
  coord_lat_double = coord_lat * 2
  grid_lat = 180 - coord_lat_double
  return(grid_lat)
}