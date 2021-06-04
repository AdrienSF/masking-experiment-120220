function dispCheckerboard(session)
    [xCenter, yCenter] = RectCenter(session.windowRect);

    toTexture = 255*repmat(eye(2), 16, 16);
    checkerTexture = Screen('MakeTexture', session.window, toTexture);

    [s1, s2] = size(toTexture);
    dstRect = session.windowRect;
    dstRect = CenterRectOnPointd(dstRect, xCenter, yCenter);

    Screen('DrawTextures', session.window, checkerTexture, [], dstRect, 0, 0);

end
