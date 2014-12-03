close all; clear all;

Nmax=100;
tO=zeros(1,Nmax/10);     %time of original algorithm
tF=tO;              %time of modified algorithm

r = linspace(0,2*pi,1000);
V = repmat([zeros(1,10) ones(1,10)],1,50);
for N=Nmax% N=10:10:Nmax
    [HO, tO(N/10)] = matHackOri(N,r,V);
    [HF, tF(N/10)] = matHackFil(N,r,V);
end
GO = -N/2:N/2;
GF = [-N/2:2:-N/4 -(N/4-1):(N/4-1) N/4:2:N/2];

figure('Name','Comparison','Color','w')
plot(GO,eig(HO),'b*',GF,eig(HF),'ro'); axis tight
%plot(eig(HO),'b*'); hold on 
%plot(eig(HF),'ro'); axis tight
legend('Original Code','Accelerated  Code','Location','Northwest')
%xlabel('N=1:100','Fontsize',30);
ylabel('eigenvalues','Fontsize',30)
set(gca,'FontSize',20)


% load('C:\Users\gcorrea\Dropbox\MATLAB\phonon\matHackdata.mat')
% %N=N-10;
% 
% N=400;
% n=10:10:N;
% tO=tO(1:N/10);
% tF=tF(1:N/10);
% 
% figure('Name','Comparison','Color','w')
% %plot(n(1:40), tO(:,1:40),'bo',n(1:40),tF(:,1:40),'ro')
% plot(n, tO,'bo',n,tF,'ro'); axis tight
% legend('Original Code','Accelerated  Code','Location','Northwest')
% xlabel('N','Fontsize',30);ylabel('time (s)','Fontsize',30)
% set(gca,'FontSize',20)
% 
% 
% figure('Name','Difference','Color','w')
% %plot(n(1:40), tO(:,1:40)-tF(:,1:40),'ro')
% plot(n, tO-tF,'ro'); axis tight
% xlabel('N','Fontsize',30);ylabel('time (s)','Fontsize',30)
% title('Time saved','Fontsize',40)
% set(gca,'FontSize',20)
% 
