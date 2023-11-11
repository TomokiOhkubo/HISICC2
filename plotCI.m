function [ci_full,pOptValue] = plotCI(pOpt,optInfo)
    
    idx = false(height(pOpt),1);
    for i = 1:height(pOpt)
        idx(i) = pOpt(i).Free == 1;
    end
    
    pOptEstimated = pOpt(idx);
    pOptValue = zeros(sum(idx),1);
    pScale = zeros(sum(idx),1);
    pName = cell(sum(idx),1);
    
    for i = 1:height(pOptEstimated)
        pOptValue(i,1) = pOptEstimated(i).Value;
        pScale(i,1) = pOptEstimated(i).Scale;
        pName{i,1} = pOptEstimated(i).Name;
    end
    
    resid = optInfo.SolverOutput.residual; % residual vector
    J = optInfo.Jacobian.F; % Jacobian
    
    % calculate the confidence intervals
    ci = nlparci(pOptValue,resid,'jacobian',J);
    
    ci_full = diff(ci')'.*pScale; % half length of the CI
    ci_half = 0.5*ci_full; % half length of the CI

    ci_ratio = ci_half./pOptValue;
    
    % parameter names
    pName = convertCharsToStrings(pName);
    name1 = categorical(pName);
    name2 = reordercats(name1,pName);
    
    figure
    barh(name2,ci_ratio,'BaseValue',1)
    ax = gca;
    ax.XScale = 'log';
    ax.TickLabelInterpreter ="none"; % turn off TeX interpretation of the parameter names
    ax.XAxisLocation = 'origin';
    % ylim([0.001 100])
    ylabel('CI half length/Estimated value')
end