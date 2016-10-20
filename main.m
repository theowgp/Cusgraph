% clear all

%% PARAMETERS:
% number of agents
N = 7;
% dimension
d = 2;
% final time
T = 100;
% mesh length
n = 300;
% create mesch
mesh = Mesh(T, n);



%% INITIAL CONDITIONS
% initial positions
x0 = initx(N, d, N);
% x0 = x00; 

% initial velocities
v0 = initv(N, d, N);
% v0 = v00;




%% CREATE THE DYNAMICS
gamma = 1;
delta = 1;
M = 1;
SET_ADJACENCY_MATRIX;% script;
dynamics = Dynamics(N, d, gamma, delta,  M, Adjacency);




%% CREATE RUNGE KUTTA SOLVER
A = [0 0 0; 0.5 0 0; -1 2 0];
b = [1.0/6.0    2.0/3.0    1.0/6.0];
s = 3;
Nu = N;

arg0 = [reshape(x0', [N*d, 1]); reshape(v0', [N*d, 1])];

rk = RungeKutta(A, b, s, dynamics, arg0, 2*N*d, Nu, T, n);



%% SET THE TIME ARRAY
t = mesh.t;


%% SOLVE THE PROBLEM FOR COMPARISON
[solx, soly] = rk.solve_forward_equation('my');
sol = solx';



%% SOLVE THE BFK PROBLEM FOR COMPARISON
[solxBFK, solyBFK] = rk.solve_forward_equation('BFK');
solBFK = solxBFK';






OUTPUT %script