function [pOpt,optInfo] = parallelEstimation(p,Simulator,Exp,expToUse,outputToUse,lambda,options,Woutput)
    
    modelName = Exp(1).ModelName
    open_system(modelName)
    modelopened = true

    if strcmp(options.Method,'lsqnonlin')
        isOutputVector = true
    else
        isOutputVector = false
    end

    estFcn = @(p) estimation_Objective(p,Simulator,Exp,expToUse,outputToUse,lambda,isOutputVector,Woutput);

    tic
    [pOpt,optInfo] = sdo.optimize(estFcn,p,options)
    toc
    
end