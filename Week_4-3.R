# 4-3����

# ������ ������ �ո��� ���� �з� ��ȭ 
plot(NA, xlab = "������ ���� Ƚ��", ylab = "�ո��� ������ ����", xlim = c(0, 100), ylim = c(0,1),
     main = "������ ������ Ƚ���� ���� �ո��� ���� Ȯ�� ��ȭ")
abline(h=0.5, col="red", lty=2) # lty - lineType

count<-0

for(n in 1:100) {
  coin <- sample(c("�ո�", "�޸�"), 1)
  
  if(coin == "�ո�") {
    count = count + 1
  }
  
  prob <- count / n
  
  points(n, prob)
}