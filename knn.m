function accuracy = knn(X_train, X_test,y_train,y_test, k)

%oklid uzaklığı
for i = 1 : size(X_test)
distance = sqrt((X_train(:, 1) - X_test(i,1)) .^ 2 + (X_train(:, 2) - X_test(i,2)) .^ 2 + (X_train(:, 3) - X_test(i,3)) .^ 2 + (X_train(:, 4) - X_test(i,4)) .^ 2);%öklid distance 
distance(:, 2) = y_train; %labelları karşılaştırma için atama
sorted_rows = sortrows(distance, 1);  %distance için sütun sıralaması (satır değil) 

if (mod(k, 2) == 1) % K değerine göre mod, eşitlik olursa diye koşul var.
pred(i) = mode(sorted_rows(1 : k, 2));  %dist ile label belirleme

else
    non_repeated = unique(sorted_rows(1 : k, 2));
    x1 = size(non_repeated);
    count = histc(sorted_rows(1 : k, 2), uniq); %
    x2 = max(count);
    x3 = (x1 == 2) & (x2 == K/2); %eşitlik durumu
    pred(i) = mode(sorted_rows(1 : K - x3, 2));    %label belirleme
end
end

error = transpose(pred) - y_test; %toplam hata
accuracy = ((size(error, 1) - nnz(error))/size(error, 1)); %accuracy 

end