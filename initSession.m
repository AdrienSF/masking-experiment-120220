function session = initSession(subjectID, sessionID, totalBlocks, AtrialsPerBlock, BtrialsPerBlock, probeTrialsPerBlock, w, windowRect)
    trialsPerBlock = AtrialsPerBlock + BtrialsPerBlock;
    
    session.window = w;
    session.windowRect = windowRect;
    session.subjectID = subjectID;
    session.sessionID = sessionID;
    session.CreationTime = datestr(now);
    session.matlabVersion = version;
    session.trialsPerBlock = trialsPerBlock;
    session.totalBlocks = totalBlocks;
    session.current.blockNum = 1;
    session.current.trialNum = 1;
    session.intermissionText = 'Press shift+a to abort experiment. \nPress any other key to continue.';
    session.stim.face.folderPath = 'faceStim';
    session.stim.house.folderPath = 'houseStim';
    session.stim.fileExtension = '.pcx';
    
    faceFilePattern = fullfile(session.stim.face.folderPath, char(strcat('*', session.stim.fileExtension));
    houseFilePattern = fullfile(session.stim.house.folderPath, char(strcat('*', session.stim.fileExtension));
    
    session.stim.faces.fileNames = dir(faceFilePattern);
    for i = 1:size(session.stim.faces.fileNames)
        [img, color_map] = imread(session.stim.faces.fileNames(i));
        img = addNoise(img, .25);
        session.stim.faces.textures(i) = Screen('MakeTexture', session.window, ind2rgb(img, color_map));
    end

    session.stim.house.fileNames = dir(houseFilePattern);
    for i = 1:size(session.stim.house.fileNames)
        [img, color_map] = imread(session.stim.house.fileNames(i));
        img = addNoise(img, .25);
        session.stim.house.textures(i) = Screen('MakeTexture', session.window, ind2rgb(img, color_map));
    end
        
    
    for i = 1:totalBlocks
        session.blocks(i).trials = initTrialInfo(AtrialsPerBlock, BtrialsPerBlock, probeTrialsPerBlock, session.stim.face.textures, session.stim.house.textures);
    end
    
    % allTrials = initTrialInfo(AtrialsPerBlock*totalBlocks, BtrialsPerBlock*totalBlocks, probeTrialsPerBlock*totalBlocks)
    % for i = 1:totalBlocks
    %     session.blocks(i) = allTrials(((i-1)*trialsPerBlock)+1:(i*trialsPerBlock)+1)
    % end
    
end

% [WARNING]: Probe occurance random. Not ballanced between trials A and B
% [WARNING]: Face/house/noise occurance random. Not ballanced between trials A and B
function allTrials = initTrialInfo(totalAtrials, totalBtrials, faceTextures, houseTextures)
    totalTrials = totalAtrials + totalBtrials;
    % check there is the right number of stimuli
    faceTexturesShape = size(faceTextures);
    houseTexturesShape = size(houseTextures);
    if totalTrials ~= 2*faceTexturesShape(2) + houseTexturesShape(2)
        error(strcat('Error: expected totalFaceTextures = totalHouseTextures = trialsPerBlock/3 but found: ', string(totalFaceTextures), ' face textures, ', string(totalHouseTextures), ' house textures for ', string(totalTrials), ' trialsPerBlock'));
    end
    
    for i = 1:totalAtrials
        trials(i).isTypeA = 1;
        trials(i).hasProbe = 0;
    end
    for i = totalAtrials+1:totalTrials
        trials(i).isTypeA = 0;
        trials(i).hasProbe = 0;
    end
    for i = datasample(1:totalTrials,totalProbeTrials,'Replace',false)
        trials(i).hasProbe = 1;
    end
    
    
    trials = trials(randperm(totalTrials));

    trials(:).stimulus.texture = [ faceTextures houseTextures addNoise(faceTextures, .5)];
    trials(:).stimulus.type = [ repmat('face',[1 faceTexturesShape(2)]) repmat('house',[1 houseTexturesShape(2)]) repmat('noise',[1 faceTexturesShape(2)])];
    
    allTrials = trials(randperm(totalTrials));
    
end
% five blocks of 144 trials (48 faces, 48 houses, 48 noise stimuli, so that each stimulus repeated four times within a block).
% 5 blocks
% 144 trials
% half A, half B
% ~15% probed

% [xCenter, yCenter] = RectCenter(session.windowRect);
% dstRect = session.windowRect;
% dstRect = CenterRectOnPointd(dstRect, xCenter, yCenter);
% Screen('DrawTextures', session.window, checkerTexture, [], dstRect, 0, 0);
%


function noised = addNoise(img, noiseRatio)
    shape = size(img);
    totalPix = shape(1)*shape(2);
    toFlip = datasample(1:total_pix, round(total_pix*noiseRatio), 'Replace',false);
    img(toFlip) = 255 * ~img(toFlip);
    
    noised = img;
    
end