
function runTrial(stimulus, isTypeA, hasProbe, session)
    % check framerate
    flip_interval = Screen('GetFlipInterval', session.window);
    % ms * fps = frames
    % ms / flip_interval = frames

    dispCross(session);
    Screen('Flip', session.window);
    waitFrames(.705/flip_interval);
    %wait 705 ms

    dispCheckerboard(session);
    Screen('Flip', session.window);
    waitFrames(.096/flip_interval);
    %wait 96 ms

    
    if isTypeA
        dispCross(session);
        Screen('Flip', session.window);
        waitFrames(.096/flip_interval);
        %wait 96
    end

    if hasProbe
        dispProbe(session);
    end


    dispStimulus(session);
    Screen('Flip', session.window);
    waitFrames(.033/flip_interval);
    %wait 33


    if hasProbe
        dispProbe(session);
    end

    if isTypeA
        dispCross(session);
        Screen('Flip', session.window);
        waitFrames(.096/flip_interval);
        %wait 96
    end

    if hasProbe
        dispProbe(session);
    end


    dispCheckerboard(session);
    Screen('Flip', session.window);
    waitFrames(.096/flip_interval);
    %wait 96 ms

        

end