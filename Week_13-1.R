# 13-1����

# install.packages("neuralnet")
library(neuralnet)

# 1) ������ Ȯ��
data = iris

# 2) ����ġ Ȯ��
na = apply(data, 2, is.na)
na
apply(na, 2, sum)

# 3) ������ ����ȭ
maxs = apply(data[, 1:4], 2, max)
maxs
mins = apply(data[, 1:4], 2, min)
mins
data[, 1:4] = scale(data[, 1:4], center = mins, scale = maxs- mins)
data[, 1:4]

# 4) ��� ������ ����
data$setosa = ifelse(data$Species=="setosa", 1, 0)
data$virginica = ifelse(data$Species=="virginica", 1, 0)
data$versicolor = ifelse(data$Species=="versicolor", 1, 0)

head(data)

# 5) �н���� �׽�Ʈ�� ������ �и�
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

# 6) �н� �� ���� ���
nn = neuralnet(f, data=train, hidden=c(6,6), linear.output=F)
plot(nn)

# 7) �׽�Ʈ
predicted = compute(nn, test[, -5:-8])
predicted$net.result

idx = max.col(predicted$net.result)
idx

species = c('setosa', 'versicolor', 'virginica')
predicted = species[idx]
predicted

# 8) ������ ��� ������ ��(����)
table(test$Species, predicted)
