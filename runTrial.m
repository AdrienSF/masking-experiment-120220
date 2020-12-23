
function runTrial(stimulus, isTypeA, hasProbe, session)
    % check framerate
    fps = Screen('GetFlipInterval', session.window);
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