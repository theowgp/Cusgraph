function res = compare_matrices( A, B, N )
res = 1;

for i = 1:N
    for j = 1:N
        if A(i, j) ~= B(i, j)
            res = 0;
            break
        end
    end
end

end

