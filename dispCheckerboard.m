function dispCheckerboard(session)
    [xCenter, yCenter] = RectCenter(session.windowRect);

    toTexture = repmat(eye(2), 4, 4);
    checkerTexture = Screen('MakeTexture', session.winow, toTexture);

    [s1, s2] = size(toTexture);
    dstRect = [0 0 s1 s2] .* 90;
    dstRect = CenterRectOnPointd(dstRect, xCenter, yCenter);

    filterMode = 0;
    Screen('DrawTextures', session.winow, checkerTexture, [], dstRect, 0, filterMode);

end
