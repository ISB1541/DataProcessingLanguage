# 11-1주차

# 시물레이션 : 시간에 따라 시스템 또는 실세계의 과정이 변하는 것을 모방
## 대상이 복잡 혹은 불확실성으로 미래 예측이 어려운 경우, 유용하게 사용

## 아날로그 시뮬레이션 : 시스템을 모방하여 만든 실제 모형으로 현상 파악
## 디지털 시뮬레이션 : 컴퓨터를 이용해서 수치적으로 분석

# 패키지
## rgl : 3차원 그래프 시각화

# 표본추출 : 복원과 비복원 ex) sample(1:10, 5, replace = T or F)
# 난수 : 균등한 분포를 갖는 수의 범위에서 무작위로 추출하는 수열

# 동전 던지기
## 1) 이론적인 확률의 그래프 출력
## 2) 시행횟수 초기화 
## 3) 앞면이 나온 횟수의 초기화
## 4) 동전 1회 던지기 - sample()
## 5) 앞면이 나온 총 누적 수 계산
## 6) 앞면이 나온 비율 계산 - sum/x()
## 7) 앞면이 나온 비율의 그래프 출력 - points()

## abline(a= 0.5, b = 0, col = "red") - a : 절편, b : 기울기
