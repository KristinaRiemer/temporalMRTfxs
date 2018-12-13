#' Conversion of longitudinal coordinates to grid format
#' 
#' Takes longitudinal coordinates and uses proper math formula to get grid values
#' 
#' @param coord_lon longitudinal coordinates
#' 
#' @return single numeric value
#' 
#' @examples 
#' lon_conversion(20)
#' 
#' @export

lon_conversion = function(coord_lon){
  coord_lon_double = coord_lon * 2
  if(coord_lon_double < 0){
    grid_lon = 720 + coord_lon_double
  } else {
    grid_lon = coord_lon_double
  }
  return(grid_lon)
}