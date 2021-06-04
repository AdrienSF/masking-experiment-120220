function dispStimulus(session)
    
    textureToDisp = session.blocks(session.current.blockNum).trials(session.current.trialNum).stimulus.texture;
    [xCenter, yCenter] = RectCenter(session.windowRect);
    dstRect = session.windowRect;
    dstRect = CenterRectOnPointd(dstRect, xCenter, yCenter);
    Screen('DrawTexture', session.window, textureToDisp, [], dstRect, 0, 0);

end