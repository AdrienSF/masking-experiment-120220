function runSession()
    while session.current.blockNum <= session.totalBlocks
        while session.current.trialNum <= session.trialsPerBlock

            trialInfo = session.blocks(session.current.blockNum).trials(session.current.trialNum);
            runTrial(trialInfo.stimulus, trialInfo.isTypeA, trialInfo.hasProbe);

            session.current.trialNum = session.current.trialNum + 1
        end
        session.current.blockNum = session.current.blockNum + 1
    end

end


function runTrial(stimulus, isTypeA, hasProbe)
    dispCross();
    %wait 705 ms

    dispCheckerboard();
    %wait 96 ms

    
    if isTypeA
        dispCross();
        %wait 96
    end

    if hasProbe
        dispProbe();
    end


    dispStimulus();
    %wait 33


    if hasProbe
        dispProbe();
    end

    if isTypeA
        dispCross();
        %wait 96
    end

    if hasProbe
        dispProbe();
    end


    dispCheckerboard();
    %wait 96 ms

        

end
    