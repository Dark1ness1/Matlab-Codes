function main

function d=laplace(A)
    if isscalar(A)
        d=A;
    else
        d = 0;
        
        for k = 1:size(A,1)
            b = A;
            b(k,:) = [];
            b(:,1) = [];
            d = d + (-1)^(k+1)*A(k,1)*laplace(b);
        end 
    end
 end

% finding relationship between run time and matrix size
runtime = [];
matrix_size = [];

for n=3:10
    Matrix = randi(9,n,n);
    tic
    result = laplace(Matrix);
    time = toc;
    fprintf('The determinent of %d x %d matrix is %.2f calculated in %f seconds\n',n,n,result,time) %run time of nxn matrix
    runtime(n-2) = time;
    matrix_size(n-2) = n;
    
end
plot(matrix_size,runtime)
xlabel('Matrix Size nxn')
ylabel('Run Time in sec')

end