clear variables; clc;
load('rawneuro_1');
load('bandneuro_1')
load('raw_male_1');
load('s_fun_male_1');
load('raw_female_1');
load('s_fun_female_1');
load('rawneuro_2');
load('bandneuro_2')
load('raw_male_pm');
load('s_fun_male_pm');
load('raw_female_pm');
load('s_fun_female_pm');
load('rawneuro_cross');
load('bandneuro_cross');
f1 = 64;
f2 = 256;
f3 = 16000;
figure(1)
subplot(2,1,1)
plot(rawneuro_2(1,f2*51:f2*53),mean(rawneuro_2(2:end,f2*51:f2*53)));
xlim([51,53]);
subplot(2,1,2)
plot(bandneuro_2(1,f1*51:f1*53),bandneuro_2(2,f1*51.4:f1*53.4));
xlim([51,53]);

figure(2)
subplot(2,1,1)
plot(raw_male_pm(1,f3*51:f3*53),raw_male_pm(2,f3*51:f3*53));
xlim([51,53]);
subplot(2,1,2)
plot(s_fun_male_pm(1,f1*51:f1*53),s_fun_male_pm(2,f1*51:f1*53));
xlim([51,53]);

figure(3)
subplot(2,1,1)
plot(raw_female_pm(1,f3*51:f3*53),raw_female_pm(2,f3*51:f3*53));
xlim([51,53]);
subplot(2,1,2)
plot(s_fun_female_pm(1,f1*51:f1*53),s_fun_female_pm(2,f1*51.2:f1*53.2));
xlim([51,53]);

% figure(4)
% subplot(2,1,1)
% plot(rawneuro_pm(1,f2*51:f2*53),mean(rawneuro_pm(2:end,f2*51:f2*53)));
% xlim([51,53]);
% subplot(2,1,2)
% plot(bandneuro_pm(1,f1*51:f1*53),bandneuro_pm(2,f1*51.4:f1*53.4));
% xlim([51,53]);

figure(5)
subplot(2,1,1)
plot(rawneuro_cross(1,f2*51:f2*53),mean(rawneuro_cross(2:end,f2*51:f2*53)));
xlim([51,53]);
subplot(2,1,2)
plot(bandneuro_cross(1,f1*51:f1*53),bandneuro_cross(2,f1*51.4:f1*53.4));
xlim([51,53]);