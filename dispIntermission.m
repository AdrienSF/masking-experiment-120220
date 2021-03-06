function abortSession = dispIntermission(session)
    % disp a message
    message = strcat(session.intermissionText, '\n\nBlock: ', string(session.current.blockNum), '/', string(session.totalBlocks), '        Trial:', string(session.current.trialNum), '/', string(session.trialsPerBlock));
    DrawFormattedText(session.window, char(message), 'center', 'center', 1);
    Screen('Flip', session.window);

    % if shift+A => abort, else => continue
    ListenChar(0);
    if GetChar() == 'A'
        abortSession = 1;
    else
        abortSession = 0;
    end
    ListenChar(0);
    
end