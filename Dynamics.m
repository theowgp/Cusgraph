classdef Dynamics
       
    properties
       N;
       d;
        
       gamma;
       
       delta;
       
      
       
       eps;
       
    
       
       M;
       
       cp;
       
       
       A;
        
    end
    
    
    
    
    
    
    methods
        
        function obj = Dynamics(N, d, gamma, delta,  M, A)
            obj.N = N;
            obj.d = d;
            obj.delta = delta;
            obj.gamma = gamma;
          
            obj.M = M;
            
            obj.A = A;
         
            
            %cutoff precision
%             obj.cp = 0.0000001;% worse than 0
            obj.cp = 0;
        end
        

        
        
        
        function res = fx(obj, v)
            res = v;
        end
        
            
        
        function [obj, res] = fv(obj, x, v, key)
            res = zeros(obj.N, obj.d);
            

            for i=1:obj.N
                temp = zeros(1, obj.d);
                for j=1:obj.N
                    temp = temp+  obj.a(norm(x(i, :) - x(j, :))) * (v(j, :) - v(i, :));
                end 
                [obj, ctrl] = obj.control(x, v, i, key);
                res(i, :) = temp/obj.N + ctrl;
            end
        end
        
        function [obj, res] = control(obj, x, v, i, key)
            res = zeros(1, obj.d);
            Adjc = set_adjacency_matrix(v, obj.N);
%             Adjc = obj.A;
            
            if strcmp(key, 'my')
                nfactor = 0;
                for j = 1:obj.N
                    nfactor = nfactor+  obj.A(i, j);
                    res = res+  obj.A(i, j)*v(j, :);
                end
                res = res/nfactor - v(i, :);
            end
            
            if strcmp(key, 'BFK')
%                 global 
                res = obj.mean(v) - v(i, :);
            end

            if ~compare_matrices( Adjc, obj.A, obj.N )
                 warning('zaraza');
                 gplot( Adjc, x, '-*')
                 hold all
            end
            obj.A = Adjc;
            
            res = res * obj.M;
        end
        
        
        function res = mean(obj, w)
            temp = zeros(1, obj.d);
            for j = 1:obj.N
                temp = temp+    w(j, :);
            end
            
            res = temp/obj.N;
        end
        
              
        function res = a(obj, r)
            res = 1/(1 + r^2)^obj.delta;
%             res = 0;
        end
        

        
        
               
        
        function [obj, res] = F(obj, argx, u)
            [x, v] = convert(argx, obj.N, obj.d);
            [obj, fv] = obj.fv(x, v, u);
            res = [reshape(obj.fx(v)', [obj.N*obj.d, 1]);    reshape(fv', [obj.N*obj.d, 1])];
        end
        
        
        
        
        
        
        
    
    
        
        
    end 
    
    
    methods(Static)
        
        
    end
    
end

