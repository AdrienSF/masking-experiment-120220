function sess = runSession(session)
    while session.current.blockNum <= session.totalBlocks
        while session.current.trialNum <= session.trialsPerBlock

            trialInfo = session.blocks(session.current.blockNum).trials(session.current.trialNum);
            runTrial(trialInfo.stimulus, trialInfo.isTypeA, trialInfo.hasProbe, session);

            session.current.trialNum = session.current.trialNum + 1;
        end
        session.current.blockNum = session.current.blockNum + 1;
    end
    sess = session;
end


    