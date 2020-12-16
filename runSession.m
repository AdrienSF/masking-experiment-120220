function runSession()
    while session.current.block <= session.totalBlocks
        runBlock();
    end

end

function runBlock()
    while session.current.trial <= session.trialsPerBlock
        runBlock();
    end
