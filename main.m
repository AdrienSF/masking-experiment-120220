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

[w, windowRect] = PsychImaging('OpenWindow', screenNumber, 0.5);

session = initSession(5, 72, 72, 10, w, windowRect);

while ~session.isComplete
    runSession();
end


% Wait for a key press
KbStrokeWait;

sca;