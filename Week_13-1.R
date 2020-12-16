# 13-1주차

# install.packages("neuralnet")
library(neuralnet)

# 1) 데이터 확인
data = iris

# 2) 결측치 확인
na = apply(data, 2, is.na)
na
apply(na, 2, sum)

# 3) 데이터 정규화
maxs = apply(data[, 1:4], 2, max)
maxs
mins = apply(data[, 1:4], 2, min)
mins
data[, 1:4] = scale(data[, 1:4], center = mins, scale = maxs- mins)
data[, 1:4]

# 4) 출력 데이터 생성
data$setosa = ifelse(data$Species=="setosa", 1, 0)
data$virginica = ifelse(data$Species=="virginica", 1, 0)
data$versicolor = ifelse(data$Species=="versicolor", 1, 0)

head(data)

# 5) 학습용과 테스트용 데이터 분리
n = nrow(data)
set.seed(2000)
index = sample(1:n, round(0.8*n))
index
train = as.data.frame(data[index,])
head(train)
test = as.data.frame(data[-index,])
head(test)

f.var.independent = "Sepal.Length + Sepal.Width + Petal.Length + Petal.Width"
f.var.dependent = "setosa + versicolor + virginica"
f = paste(f.var.dependent, "~", f.var.independent)
f

# 6) 학습 및 모형 출력
nn = neuralnet(f, data=train, hidden=c(6,6), linear.output=F)
plot(nn)

# 7) 테스트
predicted = compute(nn, test[, -5:-8])
predicted$net.result

idx = max.col(predicted$net.result)
idx

species = c('setosa', 'versicolor', 'virginica')
predicted = species[idx]
predicted

# 8) 실제값 대비 예측값 비교(분포)
table(test$Species, predicted)

