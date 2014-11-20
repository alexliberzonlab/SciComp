load neurondata/cell_dirs_001.txt
load neurondata/cell_spks_001.txt
figure
plot(cell_dirs_001'*180/pi, cell_spks_001','bs-')
xlabel('DIRECTION (deg)')
ylabel('MEAN FIRING RATE (spikes/sec)')
hold on
num_trials = size(cell_dirs_001,1);
PDs = ones(num_trials,1)*NaN;
for i=1:num_trials
	[PDs(i),IR,M,IX,IY,IXY,CX,CY,CR] = platemethod(cell_dirs_001(i,:), cell_spks_001(i,:));
    plot([PDs(i) PDs(i)]*180/pi,get(gca,'ylim'),'r-')
end
disp(PDs*180/pi)
title(sprintf('MEAN PD = %.2f deg', mean(PDs)));
