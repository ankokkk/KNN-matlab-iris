clear; 
close all; 
clc;

%Iris verisetini yükleme
dataset_path = 'C:\Users\UtkuKaraca\Desktop\knn\';
load(strcat(dataset_path,'iris.mat'))

%Rastgele bir şekilde verisetini ayırma
[m,n] = size(X) ;
P = 0.7 ;%train test oranı
ind = randperm(n) ;%index belirleme
X_train = X(:,ind(1:round(P*n))).' ; %split
X_test = X(:,ind(round(P*n)+1:end)).' ;
y_train = Y(:,ind(1:round(P*n))).' ;
y_test = Y(:,ind(round(P*n)+1:end)).';

accuracy = knn(X_train,X_test,y_train,y_test,5) %accuracy çıktısı veren knn fonksiyonu



