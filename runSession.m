function runSession(session)
    while session.current.blockNum <= session.totalBlocks
        while session.current.trialNum <= session.trialsPerBlock

            trialInfo = session.blocks(session.current.blockNum).trials(session.current.trialNum);
            runTrial(trialInfo.stimulus, trialInfo.isTypeA, trialInfo.hasProbe, session);

            session.current.trialNum = session.current.trialNum + 1;
        end
        session.current.blockNum = session.current.blockNum + 1;
    end
    return session;
end


function runTrial(stimulus, isTypeA, hasProbe, session)
    % check framerate
    fps = Screen('GetFlipInterval', window);
    % ms * fps = frames

    dispCross(session);
    Screen('Flip', session.window);
    waitFrames(.705*fps);
    %wait 705 ms

    dispCheckerboard(session);
    Screen('Flip', session.window);
    waitFrames(.096*fps);
    %wait 96 ms

    
    if isTypeA
        dispCross(session);
        Screen('Flip', session.window);
        waitFrames(.096*fps);
        %wait 96
    end

    if hasProbe
        dispProbe(session);
    end


    dispStimulus(session);
    Screen('Flip', session.window);
    waitFrames(.033*fps);
    %wait 33


    if hasProbe
        dispProbe(session);
    end

    if isTypeA
        dispCross(session);
        Screen('Flip', session.window);
        waitFrames(.096*fps);
        %wait 96
    end

    if hasProbe
        dispProbe(session);
    end


    dispCheckerboard(session);
    Screen('Flip', session.window);
    waitFrames(.096*fps);
    %wait 96 ms

        

end
    