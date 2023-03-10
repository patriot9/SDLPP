function proper_dim = getProperDim(lambda, dim_para)
% getProperDim determines the dimensionality of the projected feature space
%
% Syntax
%
%       proper_dim = getProperDim(lambda, dim_para)
%
% Description
%
%       getProperDim takes,
%           lambda           - Derived eigenvalues
%           dim_para         - The threshold which controls the dimensionality of the projected feature space
%
%      and returns,
%           proper_dim       - The dimensionality of the projected feature space
%

if dim_para == 0
    proper_dim = length(lambda);
    return;
end

if dim_para < 1 % use thr
    thr = dim_para;
    sum_lambda = sum(lambda);
    lambda_num = length(lambda);
    tmp_lambda = 0;                
    for lind = 1 : lambda_num
        tmp_lambda = tmp_lambda + lambda(lind);
        if tmp_lambda >= thr * sum_lambda
            proper_dim = lind;
            break;
        end
    end
else % use d
    proper_dim = dim_para;
end