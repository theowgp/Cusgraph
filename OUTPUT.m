%% GET ENDTIME VALUES
[xT, vT] = convert(solx(:, end), N, d);


%% NORM of the SYSTEM VELOCITY at the end-time
normv = norm(solx(N*d+1:2*N*d, end))


%% NORM of the BFK SYSTEM VELOCITY at the end-time
normvBFK = norm(solxBFK(N*d+1:2*N*d, end))


%% CALCULATE ENERGIES
energy_my = control_energy(solx, dynamics, mesh, N, d, 'my')
energy_BFK = control_energy(solxBFK, dynamics, mesh, N, d, 'BFK')


%% PLOT THE LYAPUNOV FUNCTION
figure
for k = 1:length(t)
%     x = reshape(sol(k, 1 : N*d), [d, N])';
    v = reshape(sol(k, N*d+1 : 2*N*d), [d, N])';
    YV(k) =  B(v, v, N);
end
plot(t, YV);
title('V(t) = 1/2N^2  sumij||vi -vj ||^2');
%% PLOT THE LYAPUNOV FUNCTION BFK
hold all
for k = 1:length(t)
%     x = reshape(solBFK(k, 1 : N*d), [d, N])';
    v = reshape(solBFK(k, N*d+1 : 2*N*d), [d, N])';
    YVBFK(k) =  B(v, v, N);
end
plot(t, YVBFK);
%  title('V(t) = 1/2N^2  sumij||vi -vj ||^2');





%% PLOT TRAJECTORIES
figure
for i = 1:N
    plot(sol(1, 2*i-1), sol(1, 2*i), 'o');
    plot(sol(:, 2*i-1), sol(:, 2*i));
    hold all
end
title('evolution');
%% PLOT TRAJECTORIES BFK
figure
for i = 1:N
    plot(sol(1, 2*i-1), sol(1, 2*i), 'o');
    plot(solBFK(:, 2*i-1), solBFK(:, 2*i));
    hold all
end
title('evolution BFK');




%% PLOT X
figure
for k = 1:length(t)
    x = reshape(sol(k, 1 : N*d), [d, N])';
    YX(k) =  B(x, x, N);
end
plot(t, YX);
title('X(t)');



%% PLOT E
figure
for k = 1:length(t)
    x = reshape(sol(k, 1 : N*d), [d, N])';
    v = reshape(sol(k, N*d+1 : 2*N*d), [d, N])';
    YE(k) =  E(x, v, N);
end
plot(t, YE);
%% PLOT E BFK
hold all
for k = 1:length(t)
    x = reshape(solBFK(k, 1 : N*d), [d, N])';
    v = reshape(solBFK(k, N*d+1 : 2*N*d), [d, N])';
    YEBFK(k) =  E(x, v, N);
end
plot(t, YEBFK);
title('E(t)');