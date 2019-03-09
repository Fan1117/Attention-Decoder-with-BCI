clear variables; clc;
addpath('D:\6001\BCI_decode\12.8\new');
load('n_o_1');
load('n_o_3');
load('n_64_1');
load('n_band_1');
load('s_m_o_1');
load('s_f_o_1');
load('s_m_t_1');
load('s_f_t_1');
load('s_m_d_1');
load('s_f_d_1');
load('crossmale_1');
load('crossfemale_1');
load('raw');
load('s_fun_male');

figure(1)
subplot(3,1,1);
plot(s_m_o_1(1,10*16000:12*16000),s_m_o_1(2,10*16000:12*16000));
subplot(3,1,2);
plot(s_m_t_1(1,10*64:12*64),s_m_t_1(2,10*64:12*64));
subplot(3,1,3);
plot(s_m_d_1(1,10*64:12*64),s_m_d_1(10*64:12*64))
%%
resample_t = (10*64:12*64)/64;
resample1_1 = resample(abs(s_m_o_1(2,:)),64,16000);
tmp_1 = s_m_o_1(2,10*16000:12*16000);
resample1_2 = resample(abs(tmp_1),64,16000);
figure(2)
subplot(3,1,1);
plot(s_m_o_1(1,10*16000:12*16000),s_m_o_1(2,10*16000:12*16000));
hold on
plot(resample_t,resample1_1(10*64:12*64));
hold off
subplot(3,1,2);
plot(resample_t,resample1_1(10*64:12*64));
subplot(3,1,3);
plot(resample_t,resample1_2);
%%
resample_t = (10*64:12*64)/64;
%test_male_one_1 = resample(abs(test_male_one(2,:)),64,16000);
%test_tmp_1 = test_male(2,10*16000:12*16000);
% test1_2 = resample(abs(test_tmp_1),64,16000);
figure(3)
subplot(2,1,1);
plot(s_m_o_1(1,10*16000:12*16000),s_m_o_1(2,10*16000:12*16000));
subplot(2,1,2);
%plot(resample_t,test_male_one(2,10.4*64:12.4*64));
%%
load('raw_male');
load('neuro1');
load('sound_mean');
load('n_64_3');
t_64 = (10*64:15*64)/64;
figure(4)
subplot(3,2,1)
plot(raw_male(1,10*16000:15*16000),raw_male(2,10*16000:15*16000));
xlim([10,15]);
% hold on
% plot(t_64,resample(abs(raw(2,10*16000:15*16000)),64,16000));
% plot(t_64,s_fun1(2,10*64:15*64));
% hold off
subplot(3,2,3)
plot(t_64,resample(abs(raw_male(2,10*16000:15*16000)),64,16000));
xlim([10,15]);
subplot(3,2,5)
plot(t_64,s_fun_male(2,10*64:15*64));
xlim([10,15]);
subplot(3,2,2)
plot(n_o_3(1,10*256:15*256),mean(n_o_3(2:end,10*256:15*256)));
xlim([10,15]);
subplot(3,2,4)
plot(n_64_3(1,10*64:15*64),mean(n_64_3(2:end,10*64:15*64)));
xlim([10,15]);
subplot(3,2,6)
plot(t_64,sound_mean(2,10*64:15*64));
xlim([10,15]);
%%
figure(5)
subplot(4,1,1);
plot(n_o_1(1,10*256:15*256),mean(n_o_1(2:end,10*256:15*256)));
xlim([10,15]);
subplot(4,1,2);
plot(n_64_1(1,10*64:15*64),mean(n_64_1(2:end,10*64:15*64)));
xlim([10,15]);
subplot(4,1,3);
plot(n_band_1(1,10*64:15*64),mean(n_band_1(2:end,10*64:15*64)));
xlim([10,15]);
subplot(4,1,4);
plot(t_64,mean(neuro1(2:end,10*64:15*64)));
xlim([10,15]);



% f_1 = 256;
% f_2 = 64;
% t = n_band_1(1,:);
% total = mean(n_band_1(2:end,:));
% male_max = find(crossmale_1(2,:) == max(crossmale_1(2,3:end)));
% o_index = find(n_o_1(1,:)==t(male_max));
% figure(1)
% subplot(3,1,1)
% plot(n_o_1(1,o_index-f_1*2:o_index),mean(n_o_1(2:end,o_index-f_1*2:o_index)));
% title('raw neural signal (n_o_1)','Interpreter','none')
% subplot(3,1,2)
% plot(t(male_max-f_2*2:male_max),mean(n_64_1(2:end,male_max-f_2*2:male_max)))
% title('neural signal after rate transition (n_64_1, 256 -> 64 Hz)','Interpreter','none')
% subplot(3,1,3)
% plot(t(male_max-f_2*2:male_max),mean(n_band_1(2:end,male_max-f_2*2:male_max)))
% title('neural signal after bandpass (n_band_1, 1 - 15 Hz)','Interpreter','none')
% figure(2)
% subplot(3,1,1)
% plot(t(male_max-f_2*2:male_max),zscore(total(male_max-f_2*2:male_max)),'b',t(male_max-f_2*2:male_max),zscore(s_m_d_1(male_max-f_2*2:male_max)),'r',t(male_max-f_2*2:male_max),zscore(s_f_d_1(male_max-f_2*2:male_max)),'g');
% legend('neural signal','male sound','female sound')
% subplot(3,1,2)
% plot(t(male_max-f_2*2:male_max),zscore(total(male_max-f_2*2:male_max)),'b',t(male_max-f_2*2:male_max),zscore(s_m_d_1(male_max-f_2*2:male_max)),'r');
% legend('neural signal','male sound')
% subplot(3,1,3)
% plot(t(male_max-f_2*2:male_max),zscore(total(male_max-f_2*2:male_max)),'b',t(male_max-f_2*2:male_max),zscore(s_f_d_1(male_max-f_2*2:male_max)),'g');
% legend('neural signal','female sound')
% figure(4)
% subplot(3,1,1)
% plot(t(male_max-f_2*2:male_max),zscore(total(male_max-f_2*2:male_max)),'b',t(male_max-f_2*2:male_max),zscore(s_m_o_1(male_max-f_2*2:male_max)),'r',t(male_max-f_2*2:male_max),zscore(s_f_o_1(male_max-f_2*2:male_max)),'g');
% legend('neural signal','male sound','female sound')
% subplot(3,1,2)
% plot(t(male_max-f_2*2:male_max),zscore(total(male_max-f_2*2:male_max)),'b',t(male_max-f_2*2:male_max),zscore(s_m_o_1(male_max-f_2*2:male_max)),'r');
% legend('neural signal','male sound')
% subplot(3,1,3)
% plot(t(male_max-f_2*2:male_max),zscore(total(male_max-f_2*2:male_max)),'b',t(male_max-f_2*2:male_max),zscore(s_f_o_1(male_max-f_2*2:male_max)),'g');
% legend('neural signal','female sound')
% figure(3)
% [acor1,lag] = xcorr(total(male_max-f_2*2:male_max),s_m_d_1(male_max-f_2*2:male_max),'coeff');
% [~,I1] = max(abs(acor1));
% lagDiff1 = lag(I1);
% timeDiff1 = lagDiff1/f_2;
% plot(lag,acor1)
% a3 = gca;
% a3.XTick = sort([-128:256:128 lagDiff1]);
% %%%%%%%%%%%%%%%%
% load('n_band_2');
% load('s_m_d_2');
% load('s_f_d_2');
% load('crossfemale_2');
% load('n_o_2');
% load('n_64_2');
% f_1 = 256;
% f_2 = 64;
% t = n_band_2(1,:);
% total = mean(n_band_2(2:end,:));
% female_max = find(crossfemale_1(2,:) == max(crossfemale_1(2,3:end)));
% o_index = find(n_o_2(1,:)==t(female_max));
% figure(4)
% subplot(3,1,1)
% plot(n_o_2(1,o_index-f_1*2:o_index),mean(n_o_2(2:end,o_index-f_1*2:o_index)));
% title('raw neural signal (n_o_2)','Interpreter','none')
% subplot(3,1,2)
% plot(t(female_max-f_2*2:female_max),mean(n_64_2(2:end,female_max-f_2*2:female_max)))
% title('neural signal after rate transition (n_64_1, 256 -> 64 Hz)','Interpreter','none')
% subplot(3,1,3)
% plot(t(female_max-f_2*2:female_max),mean(n_band_2(2:end,female_max-f_2*2:female_max)))
% title('neural signal after bandpass (n_band_1, 1 - 15 Hz)','Interpreter','none')
% figure(5)
% subplot(3,1,1)
% plot(t(female_max-f_2*2:female_max),zscore(total(female_max-f_2*2:female_max)),'b',t(female_max-f_2*2:female_max),zscore(s_m_d_1(female_max-f_2*2:female_max)),'r',t(female_max-f_2*2:female_max),zscore(s_f_d_1(female_max-f_2*2:female_max)),'g');
% legend('neural signal','male sound','female sound')
% subplot(3,1,2)
% plot(t(female_max-f_2*2:female_max),zscore(total(female_max-f_2*2:female_max)),'b',t(female_max-f_2*2:female_max),zscore(s_m_d_1(female_max-f_2*2:female_max)),'r');
% legend('neural signal','male sound')
% subplot(3,1,3)
% plot(t(female_max-f_2*2:female_max),zscore(total(female_max-f_2*2:female_max)),'b',t(female_max-f_2*2:female_max),zscore(s_f_d_1(female_max-f_2*2:female_max)),'g');
% legend('neural signal','female sound')
% figure(6)
% [acor2,lag2] = xcorr(total(female_max-f_2*2:female_max),s_m_d_1(female_max-f_2*2:female_max),'coeff');
% [~,I2] = max(abs(acor2));
% lagDiff2 = lag(I2);
% timeDiff2 = lagDiff2/f_2;
% plot(lag2,acor2)
% a3 = gca;
% a3.XTick = sort([-128:256:128 lagDiff2]);