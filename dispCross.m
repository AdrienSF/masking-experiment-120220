function dispCross()
    fixColor = 0;
    fixCrossDimPix = 10;
    lineWidthPix = 4;

    [xCenter, yCenter] = RectCenter(session.windowRect);

    vertCoords = [ xCenter (yCenter - fixCrossDimPix) xCenter (yCenter + fixCrossDimPix) ];
    horzCoords = [ (xCenter - fixCrossDimPix) yCenter (xCenter + fixCrossDimPix) yCenter ];


    Screen('DrawLine', session.window, 0, vertCoords(1),vertCoords(2),vertCoords(3),vertCoords(4), lineWidthPix); % vert
    Screen('DrawLine', session.window, 0, horzCoords(1),horzCoords(2),horzCoords(3),horzCoords(4), lineWidthPix); % horz

end
