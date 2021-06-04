
function runTrial(stimulus, isTypeA, hasProbe, session)
    % check framerate
    % flip_interval = Screen('GetFlipInterval', session.window);
    % ms * fps = frames
    % ms / flip_interval = frames

    dispCross(session);
    vbl = Screen('Flip', session.window);
    %wait 705 ms

    dispCheckerboard(session);
    dispCross(session);
    WaitSecs('UntilTime', vbl + session.params.startWait);
    vbl = Screen('Flip', session.window);
    %wait 96 ms

    
    if isTypeA
        dispCross(session);
        WaitSecs('UntilTime', vbl + session.params.checkerBoardWait);
        vbl = Screen('Flip', session.window);
        %wait 96
    end

    if hasProbe
        dispProbe(session);
    end


    dispStimulus(session);
    dispCross(session);
    if isTypeA
        WaitSecs('UntilTime', vbl + session.params.blankWait);
    else
        WaitSecs('UntilTime', vbl + session.params.checkerBoardWait);
    end
    vbl = Screen('Flip', session.window);
    %wait 33


    if hasProbe
        dispProbe(session);
    end

    if isTypeA
        dispCross(session);
        dispCross(session);
        WaitSecs('UntilTime', vbl + session.params.stimWait);
        vbl = Screen('Flip', session.window);
        %wait 96


        if hasProbe
            dispProbe(session);
        end


        dispCheckerboard(session);
        dispCross(session);
        WaitSecs('UntilTime', vbl + session.params.blankWait);
        vbl = Screen('Flip', session.window);
        %wait 96 ms

    else:

        if hasProbe
            dispProbe(session);
        end


        dispCheckerboard(session);
        dispCross(session);
        WaitSecs('UntilTime', vbl + session.params.stimWait);
        vbl = Screen('Flip', session.window);
        %wait 96 ms

    end

    WaitSecs('UntilTime', vbl + session.params.checkerBoardWait);

end