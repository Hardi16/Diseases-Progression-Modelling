%% Implementation of Viterbi Algorithm
%%
clc,clear all,close all;

states={'1','2','3', '4'}; %The 4 "hidden" states

Nst=length(states);
obs={'short term memory loss','rapid mood change','misplacing things', 'Challenges in planning or solving problems','New problems with words in speaking or writing','critical lass of mental functioning' }; % the 6 observations.

%Initial Probabilities of states
I_prob=[0.332 0.435 0.625 0.815]';

% Transition Probabilities of states
T_prob=[0.415 .585 0 0; 0.15 .225 .625 0;0 0.125 .29 0.585; 0 0 0.325 0.675]; % 4 states  (Needs to be transposed)

% Observation prob( Prob of observation given the state)
%O_prob=[0.6 0.2 0.15 0.05; 0.05 0.10 0.35 0.50 ; 0.25 0.25 0.25 0.25; 0.34 0.15 0.21 0.05; 0.26 0.16 0.34 0.05; 0.44 0.15 0.24 0.25]';
O_prob=[0.6 0.2 0.15 0.05 0.34 0.31; 0.05 0.10 0.35 0.50 0.24 0.15 ; 0.25 0.25 0.25 0.25 0.23 0.43; 0.34 0.15 0.21 0.05 0.45 0.15]';

% Here 1 refers to short term memory loss' 
%2 for'rapid mood change',
%3 for 'misplacing things',
%4 for 'Challenges in planning or solving problems'
% 5 for 'New problems with words in speaking or writing',
% 6 for 'critical lass of mental functioning'
oblist=[2 3 1 3 5 6];% List of observations
 lob=length(oblist);
del=zeros(Nst,lob);% collection of the maximum probability values at each stage
maxlist=del;
mx=zeros(1,lob);
for t=1:lob
    if t==1
        del(:,t)=I_prob.*O_prob(oblist(t),:)'; %Initialization
       [p mx(t)]=max(del(:,t));
        continue;
    end
    %Recursive Phase
    
    for j=1:Nst
        [del(j,t) maxlist(j,t)]=max(del(:,t-1).*T_prob(:,j));
    end
    del(:,t)=del(:,t).*O_prob(oblist(t),:)';
    [p mx(t)]=max(del(:,t)); % Read 4) in readme
end

        % Termination and Backtrack stage
dec_state=zeros(1,lob);
decode_state=cell(1,lob);
[pstar dec_state(lob)]=max(del(:,lob));

for t=lob-1:-1:1
    dec_state(t)=maxlist(dec_state(t+1),t+1);
end

for t=1:lob
decode_state{t}=states{dec_state(t)};    
end

%%
%%
states_normal={'1','2','3', '4'}; %The 4 "hidden" states

Nst_normal=length(states_normal);
obs={'short term memory loss','rapid mood change','misplacing things', 'Challenges in planning or solving problems','New problems with words in speaking or writing','critical lass of mental functioning' }; % the 6 observations.

%Initial Probabilities of states
I_prob_normal=[0.815 0.625 0.435 0.332]';

% Transition Probabilities of states
T_prob_normal=[0.415 .585 0 0; 0.15 .225 .625 0;0 0.125 .29 0.585; 0 0 0.325 0.675]; % 4 states  (Needs to be transposed)

% Observation prob( Prob of observation given the state)
%O_prob=[0.6 0.2 0.15 0.05; 0.05 0.10 0.35 0.50 ; 0.25 0.25 0.25 0.25; 0.34 0.15 0.21 0.05; 0.26 0.16 0.34 0.05; 0.44 0.15 0.24 0.25]';
O_prob_normal=[0.6 0.2 0.15 0.05 0.34 0.31; 0.05 0.10 0.35 0.50 0.24 0.15 ; 0.25 0.25 0.25 0.25 0.23 0.43; 0.34 0.15 0.21 0.05 0.45 0.15]';

% Here 1 refers to short term memory loss' 
%2 for'rapid mood change',
%3 for 'misplacing things',
%4 for 'Challenges in planning or solving problems'
% 5 for 'New problems with words in speaking or writing',
% 6 for 'critical lass of mental functioning'
oblist_normal=[2 3 1 3 5 6];% List of observations
 lob_n=length(oblist_normal);
del_n=zeros(Nst_normal,lob_n);% collection of the maximum probability values at each stage
maxlist_n=del_n;
mx_n=zeros(1,lob_n);
for t=1:lob_n
    if t==1
        del_n(:,t)=I_prob_normal.*O_prob_normal(oblist_normal(t),:)'; %Initialization
       [p mx_n(t)]=max(del_n(:,t));
        continue;
    end
    %Recursive Phase
    
    for j=1:Nst_normal
        [del_n(j,t) maxlist_n(j,t)]=max(del_n(:,t-1).*T_prob_normal(:,j));
    end
    del_n(:,t)=del_n(:,t).*O_prob_normal(oblist_normal(t),:)';
    [p mx_n(t)]=max(del_n(:,t)); % Read 4) in readme
end

        % Termination and Backtrack stage
dec_state_n=zeros(1,lob_n);
decode_state_n=cell(1,lob_n);
[pstar dec_state_n(lob_n)]=max(del_n(:,lob_n));

for t=lob_n-1:-1:1
    dec_state_n(t)=maxlist_n(dec_state_n(t+1),t+1);
end

for t=1:lob_n
decode_state_n{t}=states_normal{dec_state_n(t)};    
end
%%

dec_graph_AD = str2double(decode_state);
disp('Optimized Sequence for AD phase')
disp(dec_state)

dec_graph_normal = str2double(decode_state_n);
disp('Optimized Sequence for Normal phase')
disp(decode_state_n)

visits = 1:6;
y_AD= dec_graph_AD;
y_normal= dec_graph_normal;
%y= 1:6;
%plot(visits, y);
%plot(decode_state{t}, t);
%plot(visits, y);

plot(visits,y_AD,'--gs',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor',[1,1,1]);
hold on
plot(visits,y_normal,'--bs',...
    'LineWidth',2,...
    'MarkerSize',5,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor',[1,1,1])
hold off
%visits = linspace(1,6,1)
xlim([0 6])
ylim([0 6])


title('Optimized Sequence')
xlabel('Visits')
ylabel('Stages')
legend('AD','Normal')