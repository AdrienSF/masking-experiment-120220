% Clear the workspace and the screen
sca;
close all;
clearvars;

% Here we call some default settings for setting up Psychtoolbox
PsychDefaultSetup(2);

% Get the screen numbers
screens = Screen('Screens');

% Draw to the external screen if avaliable
screenNumber = max(screens);

% Define black and white
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);
grey = white / 2;

% Open an on screen window
%rect = [0, 0, 100, 100];
%[window, windowRect] = PsychImaging('OpenWindow', screenNumber, grey, rect);
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, grey)

% Get the size of the on screen window
[screenXpixels, screenYpixels] = Screen('WindowSize', window);

% Query the frame duration
ifi = Screen('GetFlipInterval', window);

% Set up alpha-blending for smooth (anti-aliased) lines
Screen('BlendFunction', window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');


dispProbe(window, windowRect);
sca;

%%%%%%%%%%%FUNCTIONS

function d = dispCross(window, windowRect)
    % Setup the text type for the window
    Screen('TextFont', window, 'Ariel');
    Screen('TextSize', window, 36);

    % Get the centre coordinate of the window
    [xCenter, yCenter] = RectCenter(windowRect);
    % Get the screen numbers
    screens = Screen('Screens');

    % Draw to the external screen if avaliable
    screenNumber = max(screens);

    % Define black and white
    white = WhiteIndex(screenNumber);
    black = BlackIndex(screenNumber);

    % Here we set the size of the arms of our fixation cross
    fixCrossDimPix = 40;

    % Now we set the coordinates (these are all relative to zero we will let
    % the drawing routine center the cross in the center of our monitor for us)
    xCoords = [-fixCrossDimPix fixCrossDimPix 0 0];
    yCoords = [0 0 -fixCrossDimPix fixCrossDimPix];
    allCoords = [xCoords; yCoords];

    % Set the line width for our fixation cross
    lineWidthPix = 4;

    % Draw the fixation cross in white, set it to the center of our screen and
    % set good quality antialiasing
    Screen('DrawLines', window, allCoords,...
        lineWidthPix, black, [xCenter yCenter], 2);

    % Flip to the screen
    Screen('Flip', window);

    % Wait for a key press
    KbStrokeWait;

    % Clear the screen
    sca;

    d = 1;
end



function d = dispCheckerboard(window, windowRect)

    % Get the centre coordinate of the window
    [xCenter, yCenter] = RectCenter(windowRect);

    % Set up alpha-blending for smooth (anti-aliased) lines
    Screen('BlendFunction', window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');

    % Define a simple 4 by 4 checker board
    checkerboard = repmat(eye(2), 4, 4);

    % Make the checkerboard into a texure (4 x 4 pixels)
    checkerTexture = Screen('MakeTexture', window, checkerboard);

    % We will scale our texure up to 90 times its current size be defining a
    % larger screen destination rectangle
    [s1, s2] = size(checkerboard);
    dstRect = [0 0 s1 s2] .* 90;
    dstRect = CenterRectOnPointd(dstRect, xCenter, yCenter);

    % Draw the checkerboard texture to the screen. By default bilinear
    % //filtering is used. For this example we don't want that, we want nearest
    % neighbour so we change the filter mode to zero
    filterMode = 0;
    Screen('DrawTextures', window, checkerTexture, [],...
        dstRect, 0, filterMode);

    % Flip to the screen
    Screen('Flip', window);

    % Wait for a key press
    KbStrokeWait;

end

function d = dispProbe(window, windowRect)
    rand('seed', sum(100 * clock));

    % Get the size of the on screen window in pixels.
    % For help see: Screen WindowSize?
    [screenXpixels, screenYpixels] = Screen('WindowSize', window);

    % Get the centre coordinate of the window in pixels
    % For help see: help RectCenter
    [xCenter, yCenter] = RectCenter(windowRect);

    % Enable alpha blending for anti-aliasing
    % For help see: Screen BlendFunction?
    % Also see: Chapter 6 of the OpenGL programming guide
    Screen('BlendFunction', window, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

    % Set the color of our dot to full red. Color is defined by red green
    % and blue components (RGB). So we have three numbers which
    % define our RGB values. The maximum number for each is 1 and the minimum
    % 0. So, "full red" is [1 0 0]. "Full green" [0 1 0] and "full blue" [0 0
    % 1]. Play around with these numbers and see the result.
    dotColor = [1 0 0];

    % Determine a random X and Y position for our dot. NOTE: As dot position is
    % randomised each time you run the script the output picture will show the
    % dot in a different position. Similarly, when you run the script the
    % position of the dot will be randomised each time. NOTE also, that if the
    % dot is drawn at the edge of the screen some of it might not be visible.
    dotXpos = rand * screenXpixels;
    dotYpos = rand * screenYpixels;

    % Dot size in pixels
    dotSizePix = 20;

    % Draw the dot to the screen. For information on the command used in
    % this line type "Screen DrawDots?" at the command line (without the
    % brackets) and press enter. Here we used good antialiasing to get nice
    % smooth edges
    Screen('DrawDots', window, [dotXpos dotYpos], dotSizePix, dotColor, [], 2);

    % Flip to the screen. This command basically draws all of our previous
    % commands onto the screen. See later demos in the animation section on more
    % timing details. And how to demos in this section on how to draw multiple
    % rects at once.
    % For help see: Screen Flip?
    Screen('Flip', window);

    % Now we have drawn to the screen we wait for a keyboard button press (any
    % key) to terminate the demo. For help see: help KbStrokeWait
    KbStrokeWait;

end


function d = dispImg()

    %todo
    disp('dispImg() stub')

end