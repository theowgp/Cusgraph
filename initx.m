function x = initx(N, d, maxx )
x = zeros(N, d);

% random
for i=1:d
    t = rand(N, 1);
    x(:, i) = t * maxx;
end


% % uniform
% for i = 2:N
%     x(i, 1) = x(i-1, 1) + 1;
% end

% nice
% x = [
%     -1 0
%     0 1
%     1 0
%     0 -1
%     ];

% also nice
% x = [
%     -1 0
%     0 1
%     1 0
%     0 -1
%     ];


x = [
    -2 0
    0 0
    2 0
    18 5
    100 0
    -12 14
    10  10
    ];


end
