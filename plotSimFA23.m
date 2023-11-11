function [] = plotSimFA23(Exp,expIdx)
    
     % restore the model from Fast Restart
    modelName = Exp(1).ModelName;
    set_param(modelName,'OutputOption','RefineOutputTimes','OutputTimes','[]');

    Simulator = createSimulator(Exp(expIdx));
    Simulator = sim(Simulator);
    
    loggedSignalName = get_param(modelName,'SignalLoggingName');
    SimLog = find(Simulator.LoggedData,loggedSignalName);

    outputN = numel(Exp(1).OutputData);
    outputNames = cell(outputN);
    for outputIdx = 1:outputN
        outputNames{outputIdx} = Exp(1).OutputData(outputIdx).Name;
    end

    OutputLog = cell(3,1);
    for outputIdx = 1:outputN
        OutputLog{outputIdx} = find(SimLog,outputNames{outputIdx});
    end

    nexttile
    stairs(Exp(expIdx).InputData(1).Values.Time,Exp(expIdx).InputData(1).Values.Data,'r-');
    xlim([0 25])
    ylim([10 1000])
    ylabel('IPTG [uM]')
    set(gca,'YScale','log')

    nexttile
    stairs(Exp(expIdx).InputData(2).Values.Time,Exp(expIdx).InputData(2).Values.Data,'r-');
    xlim([0 25])
    ylim([0 1])
    ylabel('Model selection')
    
    yUpperLim = [2 2.5];
    for outputIdx = 1:outputN
        nexttile
        p = plot( ...
            OutputLog{outputIdx}.Values.Time,OutputLog{outputIdx}.Values.Data,'r-',...
            Exp(expIdx).OutputData(outputIdx).Values.Time, ... % data 1
            Exp(expIdx).OutputData(outputIdx).Values.Data, ...
            'ko' ...
            );
        for i = 2:2
            p(i).MarkerFaceColor = 'w';
            p(i).MarkerSize = 4;
        end
        ylabel(outputNames{outputIdx});
        xlim([0 25])
        ylim([0 yUpperLim(outputIdx)])
        % legend('Measured','Simulated','Location','northwest');
    end

end