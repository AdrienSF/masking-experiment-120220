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

[w, windowRect] = Screen('OpenWindow',0, 128,[0 0 640 480],32,2);
Screen('TextSize', w, 40);

dim = round(windowRect(3)/4);
[xCenter, yCenter] = RectCenter(windowRect);
stimRect = CenterRectOnPointd([0 0 dim dim], xCenter, yCenter);
session = initSession(subjectID, sessionID, 5, 63, 63, 19, w, stimRect);

session = runSession(session);

sca;