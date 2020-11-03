# 5-3주차

women
height <- women$height
weight <- women$weight

plot(x = height, y = weight, xlab = "키", ylab = "몸무게", main = "키와 몸무게의 변화", 
     pch=23, type="c")

mag <- quakes$mag

# ylab - 건수
hist(mag, main = "지진 발생 강도의 분포", xlab = "지진 강도", ylab = "발생 건수", 
     col = rainbow(10), breaks=seq(4, 6.5, by=0.5))
# ylab - 0 ~ 1
hist(mag, main = "지진 발생 강도의 분포", xlab = "지진 강도", ylab = "발생 건수", 
     col = rainbow(10), freq = FALSE)
lines(density(mag), lwd=2) # lwd 굵기

boxplot(mag, main = "지진 발생 강도의 분포", xlab = "지진 강도", ylab = "발생 건수", 
     col = "red")

Q <- quantile(mag)
Q