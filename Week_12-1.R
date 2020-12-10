# 12-1ÁÖÂ÷

install.packages("neuralnet")
library(neuralnet)

iris
data = iris

# data normalization
maxs = apply(data[, 1:4], 2, max)
mins = apply(data[, 1:4], 2, min)
data[, 1:4] = scale(data[, 1:4], center = mins, scale = maxs - mins)