function dispCheckerboard(w, windowRect)
    [xCenter, yCenter] = RectCenter(windowRect);

    toTexture = repmat(eye(2), 4, 4);
    checkerTexture = Screen('MakeTexture', w, toTexture);

    [s1, s2] = size(toTexture);
    dstRect = [0 0 s1 s2] .* 90;
    dstRect = CenterRectOnPointd(dstRect, xCenter, yCenter);

    filterMode = 0;
    Screen('DrawTextures', w, checkerTexture, [], dstRect, 0, filterMode);

end
