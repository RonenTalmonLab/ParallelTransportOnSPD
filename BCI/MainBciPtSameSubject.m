close all;
clear;

%% Load Data:
S1 = 8;
D1 = 1;

S2 = 8;
D2 = 2;

disp('Load Data');
[Events1, vClass1] = GetEvents(S1, D1);
[Events2, vClass2] = GetEvents(S2, D2);
Covs1              = CalcCovs(Events1);
Covs2              = CalcCovs(Events2);
Covs               = [Covs1, Covs2];
N                  = length(Covs);
vClass             = [vClass1, vClass2];
vS                 = [1 * ones(1, length(vClass1)), 2 * ones(1, length(vClass2))];

%%
mXM = SpdMean(Covs);

%%
vColorC = 'gmyk';
vColorS = 'rb';

%%
mX = SpdToVecs(Covs);

%%
% mTSNE = tsne(mX', 'Perplexity', 40)';
mTSNE = tsne(mX')';

%%
figure; hold on; grid on; set(gca, 'FontSize', 16);
for cc = 1 : 4
    vIdx = vClass == cc;
    scatter(mTSNE(1,vIdx), mTSNE(2,vIdx), 50, vColorC(cc), 'Fill', 'MarkerEdgeColor', 'k'); hold on;
end
axis tight
ax = gca;
ax.XTickLabel = [];
ax.YTickLabel = [];
xlabel('$z_1$', 'Interpreter', 'latex');
ylabel('$z_2$', 'Interpreter', 'latex');
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

figure; hold on; grid on; set(gca, 'FontSize', 16);
for ss = 1 : 2
    vIdx = vS == ss;
    scatter(mTSNE(1,vIdx), mTSNE(2,vIdx), 50, vColorS(ss), 'Fill', 'MarkerEdgeColor', 'k'); hold on;
%     scatter(mTSNE(1,vIdx), mTSNE(2,vIdx), 50, 'b', 'Fill', 'MarkerEdgeColor', 'k'); hold on;
end
axis tight
ax = gca;
ax.XTickLabel = [];
ax.YTickLabel = [];
xlabel('$z_1$', 'Interpreter', 'latex');
ylabel('$z_2$', 'Interpreter', 'latex');
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

%%
M1      = SpdMean(Covs1);
M2      = SpdMean(Covs2);
E       = sqrtm(M1 / M2);
Covs2PT = Covs2;
for jj = 1 : length(Covs2)
    Covs2PT{jj} = E * Covs2{jj} * E';
end

%%
CovsPT = [Covs1, Covs2PT];
mX     = SpdToVecs(CovsPT);

%%
mTSNE = tsne(mX')';

%%
figure; hold on; grid on; set(gca, 'FontSize', 16);
for cc = 1 : 4
    vIdx = vClass == cc;
    scatter(mTSNE(1,vIdx), mTSNE(2,vIdx), 50, vColorC(cc), 'Fill', 'MarkerEdgeColor', 'k'); hold on;
end
axis tight
ax = gca;
ax.XTickLabel = [];
ax.YTickLabel = [];
xlabel('$z_1$', 'Interpreter', 'latex');
ylabel('$z_2$', 'Interpreter', 'latex');
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

figure; hold on; grid on; set(gca, 'FontSize', 16);
for ss = 1 : 2
    vIdx = vS == ss;
    scatter(mTSNE(1,vIdx), mTSNE(2,vIdx), 50, vColorS(ss), 'Fill', 'MarkerEdgeColor', 'k'); hold on;
%     scatter(mTSNE(1,vIdx), mTSNE(2,vIdx), 50, 'b', 'Fill', 'MarkerEdgeColor', 'k'); hold on;
end
axis tight
ax = gca;
ax.XTickLabel = [];
ax.YTickLabel = [];
xlabel('$z_1$', 'Interpreter', 'latex');
ylabel('$z_2$', 'Interpreter', 'latex');
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

%%
function Covs = CalcCovs(Events)
    N       = length(Events);
    Covs{N} = [];
    for ii = 1 : N
        mX       = Events{ii}';
        Covs{ii} = cov(mX');
    end
end

