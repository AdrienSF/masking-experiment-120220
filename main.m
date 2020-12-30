% Clear the workspace and the screen
sca;
close all;
clearvars;

subjectID = input('subjectID: ', 's');
sessionID = input('sessionID: ', 's');



% Here we call some default settings for setting up Psychtoolbox
PsychDefaultSetup(2);

% Get the screen numbers
screens = Screen('Screens');

% Draw to the external screen if avaliable
screenNumber = max(screens);

[w, windowRect] = PsychImaging('OpenWindow', screenNumber, 0.5);
Screen('TextSize', w, 40);

session = initSession(subjectID, sessionID, 5, 72, 72, 10, w, windowRect);

session = runSession(session);

sca;