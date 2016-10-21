function res = set_weights_matrix(v, N)
res= zeros(N);
for i = 1:N
    for j = 1:N
        res(i, j) = norm(v(i, :) - v(j, :));
    end
end
end

