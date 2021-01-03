
function runTrial(stimulus, isTypeA, hasProbe, session)
    % check framerate
    % flip_interval = Screen('GetFlipInterval', session.window);
    % ms * fps = frames
    % ms / flip_interval = frames

    dispCross(session);
    vbl = Screen('Flip', session.window);
    % waitFrames(.705/flip_interval, session);
    %wait 705 ms

    dispCheckerboard(session);
    dispCross(session);
    WaitSecs('UntilTime', vbl + .705);
    vbl = Screen('Flip', session.window);
    % waitFrames(.096/flip_interval, session);
    %wait 96 ms

    
    if isTypeA
        dispCross(session);
        WaitSecs('UntilTime', vbl + .096);
        vbl = Screen('Flip', session.window);
        % waitFrames(.096/flip_interval, session);
        %wait 96
    end

    if hasProbe
        dispProbe(session);
    end


    dispStimulus(session);
    dispCross(session);
    WaitSecs('UntilTime', vbl + .096);
    vbl = Screen('Flip', session.window);
    % waitFrames(.033/flip_interval, session);
    %wait 33


    if hasProbe
        dispProbe(session);
    end

    if isTypeA
        dispCross(session);
        dispCross(session);
        WaitSecs('UntilTime', vbl + .033);
        vbl = Screen('Flip', session.window);
        % waitFrames(.096/flip_interval, session);
        %wait 96
    end

    if hasProbe
        dispProbe(session);
    end


    dispCheckerboard(session);
    dispCross(session);
    WaitSecs('UntilTime', vbl + .096);
    vbl = Screen('Flip', session.window);
    % waitFrames(.096/flip_interval, session);
    %wait 96 ms

    WaitSecs('UntilTime', vbl + .096);

end