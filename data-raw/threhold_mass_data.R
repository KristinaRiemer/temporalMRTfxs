library(dplyr)
library(devtools)

sp1 = data.frame(species = rep("A", times = 12), 
                 inds = rep(12, times = 12), 
                 yr = seq(1990, 1990+11, by = 1), 
                 location = rep("site1", 12), 
                 avg_temp = rnorm(12, mean = 15))

sp2 = data.frame(species = rep("B", times = 16), 
                 inds = rep(16, times = 16), 
                 yr = rep(seq(1990, 1990+3, by = 1), 4),
                 location = rep("site2", 16), 
                 avg_temp = rnorm(16, mean = 15))

sp3 = data.frame(species = rep("A", times = 20), 
                 inds = rep(18, times = 20), 
                 yr = seq(1990, 1990+19, by = 1), 
                 location = rep("site1", 20), 
                 avg_temp = c(rnorm(18, mean = 15), NA, NA))

threshold_mass_data = bind_rows(sp1, sp2, sp3)
use_data(threshold_mass_data)
de