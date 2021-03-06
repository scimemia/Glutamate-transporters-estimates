%Compute and plot the average measures for each cell;
%for each new simulated cell, increase the index j, 
%to record and plot the means over all cells 
%simulated to date.
global M ;
j = 1;
C(:,j) = Csholl;
GENR(:,j) = gn;
LGT(:,j) = lg./gn;
Ntrans(:,:,j) = NTR(:,:);
Ntransh(:,j) = NTh(:);
Ntranstip(:,j)=NTRtip(:)';
Ntranstiph(:,j) = NTRtiph(:);
Sarea(:,j) = SFA(:);
Sareah(j) = SAh;
Sareatip(j) = SFAtip;
Sareatiph(j) = SAhtip;
Volume(:,j) = VOLM;
Volumetip(j) = VOLMtip;
Volumeh(j) = Vh;
Volumehtip(j) = Vhtip;
Tarea(:,:,j) = SFT(:,:);
Tharea(:,j) = SFTh(:);
Tareatip(:,j) = SFTtip(:)';
Thareatip(:,j) = SFTtiph(:);
Length(j) = LENGTH;
branches(j) = BR;

%create a large enough array for tip diameters;
%diam_min(:,j) = zeros(P*2^N,1);
%create large enough arrays for XI and LAMBDA
chi_vals(:,:,j) = zeros(M,7,1);
lambda_vals(:,:,j) = zeros(M,7,1);

%put all XI and LAMBDA values into tables; zeros will be elimiated by hand;
chi_vals(:,1:P,j) = XI(:,:);
lambda_vals(:,1:P,j) = LAMBDA(:,:);
num(j) = COUNT;

%put all tip diameters into a table; zeros will be eliminated by hand;
diam_min(1:length(tipdiam),j) = tipdiam;
leaf_diameter(1:length(Diamhr),j) = Diamhr;
tipcount = length(find(tipdiam))+length(find(Diamhr));
tip_mean(j) = (sum(tipdiam)+sum(Diamhr))/tipcount;
if (max(Diamhr)>0); tip_min(j) = min(Diamhr(find(Diamhr))); else; tip_min(j) = min(tipdiam(find(tipdiam))); end
tip_max(j) = max(tipdiam(find(tipdiam)));

%%
%plotting averages over all current simulations: Sholl profile, average number of branches per level, and average
%branch length per level (in geen for experiment, and in blue for model)
i=1:401;
figure;
hold on;
plot(0.5*i,C,':b')
plot(0.5*i,mean(C,2),'b','Linewidth',2)
%plot Sholl from data, saved in the matrix A1
plot(A1(:,1),A1(:,2),'g','Linewidth',2)
axis([0 201 0 700]);
figure;
hold on;
plot(GENR,':b');
plot(mean(GENR,2),'Linewidth',2);
%plot mean number of branches per level from data, saved in A2
plot(A2(:,1),A2(:,2),'g','Linewidth',2)
figure;
hold on;
plot(LGT,':b');
plot(mean(LGT,2),'Linewidth',2);
hold on;
%plot mean branch length per level from data, saved in A3
plot(A3(:,1),A3(:,2),'g','Linewidth',2)