%% Example code 
% Created: 2022.10.25 Jonghwa Park

% load('DATA(3conditions)_rev210330.mat') % file load

condition = 1; % Experiment condition. There are three conditions
participant = 1; % Participant id. There are 10 participants for each condition (total 30 participants without double-assigned)

sample_rate = DATA(condition).EEG(participant).fs; 
display_time = [5*sample_rate : 10*sample_rate]; % time range that you want to use
display_time_sec = [5: 1/sample_rate :10]; % time range that you want to use
display_channels = [1:30]; % EEG channels that you want to use. You can refer channel info "DATA().EEG().chanlocs"

trial = 1; % experiment trial that you want to use
speech_attended = DATA(condition).INDEX(participant).a(trial);
speech_unattended = DATA(condition).INDEX(participant).u(trial);


% Plotting
figure()
subplot(3,1,1)
plot(display_time_sec, DATA(1).SPEECH(speech_attended, display_time))
title('Attended speech')
ylabel('Envelope (z)') % z-scored
ylim([-2 4]); xlim([display_time_sec(1) display_time_sec(end)])
xticks([5,6,7,8,9,10])

subplot(3,1,2)
plot(display_time_sec, DATA(1).SPEECH(speech_unattended, display_time))
title('Unattended speech')
ylabel('Envelope (z)') 
ylim([-2 4]); xlim([display_time_sec(1) display_time_sec(end)])
xticks([5,6,7,8,9,10])

subplot(3,1,3)
plot(display_time_sec, squeeze(DATA(condition).EEG(participant).data(trial,display_channels,display_time))')
title('EEG')
ylabel('Amplitude (z)')
xlabel('Time (sec)')
xlim([display_time_sec(1) display_time_sec(end)])
xticks([5,6,7,8,9,10])

% End