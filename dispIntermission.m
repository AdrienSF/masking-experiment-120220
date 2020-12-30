function abortSession = dispIntermission(session)
    % disp a message
    message = strcat(session.intermissionText, '\n\nBlock: ', char(session.current.blockNum), '/', char(session.totalBlocks), '        Trial:', char(session.current.trialNum), '/', char(session.trialsPerBlock));
    DrawFormattedText(session.window, message, 'center', 'center', 1);
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