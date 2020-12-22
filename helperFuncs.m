function waitFrames(frames)
    disp(frames)
    for i = 1:frames
        Screen('Flip', session.window);
    end
end