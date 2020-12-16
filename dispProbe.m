function dispProbe(w, windowRect)

    [xCenter, yCenter] = RectCenter(windowRect);
    dotColor = [1 0 0];
    dotSizePix = 20;
    
    screenXpixels = windowRect(3) - windowRect(1)
    screenYpixels = windowRect(4) - windowRect(2)
    rand('seed', sum(100 * clock));

    dotXpos = rand * screenXpixels;
    dotYpos = rand * screenYpixels;

    Screen('DrawDots', w, [dotXpos dotYpos], dotSizePix, dotColor, [], 2);

end
