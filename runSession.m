function sess = runSession(session)
    while session.current.blockNum <= session.totalBlocks
        while session.current.trialNum <= session.trialsPerBlock
            % wait intermission
            % if abort signal, return
            if dispIntermission(session)
                sess = session;
                disp(strcat('Session aborted at Block: ', string(session.current.blockNum), '/', string(session.totalBlocks), ' Trial:', string(session.current.trialNum), '/', string(session.trialsPerBlock)));
                sca;
                return
            end


            trialInfo = session.blocks(session.current.blockNum).trials(session.current.trialNum);
            runTrial(trialInfo.stimulus, trialInfo.isTypeA, trialInfo.hasProbe, session);

            session.current.trialNum = session.current.trialNum + 1;
        end
        fname = sprintf('subj%s_sess%s_block%02d_bkp.mat',session.subjectID,session.sessionID,session.current.blockNum);
        save(fname,'session');
        session.current.trialNum = 0;
        session.current.blockNum = session.current.blockNum + 1;
    end
    sess = session;
end


    