% estimate your heartbeat from a video
% taken with your webcam or your smartphone

% put your fingertip against the camera
% hold it up against a consistent light source
% (for example your computer screen)
% keep it still and record a video for 30 sec

% see: http://people.csail.mit.edu/mrub/vidmag/ for the cutting edge

% load in the video info
%
video = VideoReader('IMG_1383.MOV');
nframes = video.NumberOfFrames;
frameHeight = video.Height;
frameWidth = video.Width;
frameRate = video.FrameRate; % frames per second
duration = video.Duration;   % seconds
time = linspace(0,duration,nframes);

% read each video frame and compute
% brightness of the red channel
%
skiptime = 3; % skip the first 3 seconds
skipindex = round(skiptime * frameRate);
%
brt = zeros(1, nframes-skipindex);
for i = 1:nframes-skipindex
  disp(sprintf('reading frame %4d/%4d ...', i+skipindex,nframes));
  frame = read(video, i+skipindex);
%  redChannel = frame(:, :, 1);
%  brt(i) = mean(redChannel(:));
  brt(i) = mean(frame(:));
end
nframes = length(brt);
time = time(skipindex+1:end);

% subtract the mean brightness
%
brt = brt - mean(brt);

% band-pass filter between frequencies of interest
% i.e. frequencies where we expect a human adult
%      heartrate to be
%
cutoff_low = 40;   % Hz
cutoff_high = 200; % Hz
butt1 = (cutoff_low  / 60) / (frameRate / 2);
butt2 = (cutoff_high / 60) / (frameRate / 2);
[b,a] = butter(2, [butt1, butt2]);
brt_f = filtfilt(b, a, brt);

% compute a spectrum
%
[p,f] = pwelch(brt_f, [], [], [], frameRate);

% make some plots
%
figure('position',[200 200 400 800])
subplot(2,1,1)
plot(time, brt,'b-')
hold on
plot(time, brt_f, 'r-','linewidth',2)
xlabel('TIME (sec)')
ylabel('RED CHANNEL BRIGHTNESS')
subplot(2,1,2)
plot(f*60, 10*log10(abs(p)))
xlabel('FREQUENCY (bpm)')
ylabel('POWER/FREQUENCY (dB/Hz)')
xlim([0,max(f*60)])
hold on

% find peak of power spectrum
%
[yy,ii] = max(p);
peak_f = f(ii);
plot([peak_f, peak_f]*60, get(gca,'ylim'), 'r-', 'linewidth',2)

% compute heart rate in bpm (beats per minute)
%
heart_bpm = 60 * peak_f;

title(sprintf('PEAK IS %4d BPM', round(heart_bpm)))
