# 11-3주차

install.packages("rgl")
library(rgl)

# 몬테카를로 시뮬레이션으로 원주율 구하기
iteration = 1000
n_circle = 0


plot(NA, xlim = c(0, 1), ylim = c(0,1))
pts = NULL

for(i in 1:iteration) {
  # 임의의 위치에 점 생성 (x,y)
  x = runif(1, min = 0, max = 1)
  y = runif(1, min = 0, max = 1)
  
  pts = rbind(pts, c(x, y))
  # 거리 계산
  dist = sqrt(x^2 + y^2)
  
  if(dist <= 1) {
    n_circle = n_circle + 1
  }
}

points(pts, pch=19, cex=0.5, col="black")
pi = 4 * n_circle / iteration 

# 회귀선 구하기

## 문제 해결 방법
### 1) x, y 데이터 할당
### 2) a, b의 범위 설정
### 3) a와 b의 등간격 변화에 따른 비용 함수 계산
### 4) 최소비용값을 갖는 a, b 발견

## 데이터 준비 및  산포도 그리기
x <- c(1, 2.2, 3.5, 4, 5.2, 6.4, 7.1, 8.3, 9.2, 10)
y <- c(41, 47, 62, 75, 85, 90, 110, 115, 125, 140)
plot(x, y, lim=c(0,10), ylim=c(0,150))

## 기울기(b), y절편(a) (y=bx+a)
A = seq(-5, 15, by=1) # a 범위 설정
B = seq(-30, 30, by=1) # b 범위 설정

## a, b 범위의 각 구간에 대한 비용함수의 값들을 저장할 행렬(16X61) 초기화
cost.mtx = matrix(NA, nrow=length(B), ncol=length(A)) 

## 기울기와 y 절편 범위 설정 및 비용함수 구하기
for(i in 1:length(B)) {
  for(j in 1:length(A)) {
    err.sum = 0
    for ( k in 1:length(x)) {
      y_hat = B[i]*x[k] + A[j]
      err = (y_hat - y[k])^2
      err.sum = err.sum + err
    }
    cost = err.sum / length(x)
    cost.mtx[i,j] = cost
  }
}

## 기울기와 y절편 구하기
range(cost.mtx)
idx = which(cost.mtx==min(cost.mtx), arr.ind = TRUE)
idx.Bmin = idx[1,1]
idx.Amin = idx[1,2]

Bmin = B[idx.Bmin]
Amin = A[idx.Amin]
Bmin
Amin
abline(a=Amin, b=Bmin, lty=2, col="red")

## 기울기와 y절편 범위내의 비용함수 그래프
plot(B, cost.mtx[,idx.Amin])

# for(j in 1:length(B)) {
#   lines(B, cost.mtx[,j], col=j)
#   Sys.sleep(0.5)
# }

## 기울기와 y절편 범위내의 3차원 비용함수 그래프
persp3d(B,A,cost.mtx)
persp3d(B,A,cost.mtx,col="yellow", zlim=c(0,400))
