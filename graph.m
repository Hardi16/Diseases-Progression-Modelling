%%For finding probabilty of Diagnosis given state for a visit.
%% AD phase of disease
%%
pr_diagnosis_given_1=0.332;  %initial probability of state 1
pr_diagnosis_given_2=0.435;  %initial probability of state 2
pr_diagnosis_given_3=0.625;  %initial probability of state 3
pr_diagnosis_given_4=0.815;  %initial probability of state 4

state_random=  randi(100,1,3);  % test matrix for a patient generated randomly
state_main = state_random/100


state1mat = [0.1 0.2 0.3];    % assumed biomarker measurement for state 1 for three parameters blood, age, weight
state2mat = [0.2 0.3 0.4];     % assumed biomarker measurement for state 2 for three parameters blood, age, weight
state3mat = [0.3 0.4 0.5];      % assumed biomarker measurement for state 3 for three parameters blood, age, weight
state4mat = [0.4 0.5 0.6];       % assumed biomarker measurement for state 4 for three parameters blood, age, weight


a1= state_main(1,1);  %first element of random generator
a2= state_main(1,2);  %second element of random generator
a3= state_main(1,3);  %third element of random generator

% probability of a1, a2, a3 having particular value is determined by
% gaussian distribution
%for 1 st to 2 nd state 
%condition for all  biomarker becoming abnormal of all 3 parameters 
if ((a1 >= 0.1) && (a1 <= 0.2) && (a2 >= 0.2) && (a2 <= 0.3) && (a3 >= 0.3) && (a3 <= 0.4)) 
    pr_diagnosis_given_1= gaussian(a1)*gaussian(a2)*gaussian(a3) *pr_diagnosis_given_1; 
   disp('this condition satisfy3')
end
 %condition for 2 biomarker becoming abnormal of any 2 parameters
if ((a1 >= 0.1) && (a1 <= 0.2)&&(a2 >= 0.2) && (a2 <= 0.3))||((a2 >= 0.2) &&(a2 <= 0.3)&&(a3 >= 0.3)&&(a3 <= 0.4))||((a1 >= 0.1) &&(a1 <= 0.2)&&(a3 >= 0.3)&&(a3 <= 0.4))
    pr_diagnosis_given_1=(gaussian(a1)*gaussian(a2)+gaussian(a2)*gaussian(a3)+ gaussian(a1)*gaussian(a3))*pr_diagnosis_given_1;
    disp('this condition satisfy2')
end
%condition for any 1 biomarker becoming abnormal of any 2 parameters
if ((a1 >= 0.2) && (a1 <= 0.3))||((a2 >= 0.3) && (a2 <= 0.4))||((a3 >= 0.4) && (a3 <= 0.5))
    pr_diagnosis_given_1=(gaussian(a1)+gaussian(a2)+gaussian(a3))*pr_diagnosis_given_1;
    disp('this condition satisfy1')

end
  %second state to third stage
 
if ((a1 >= 0.2) && (a1 <= 0.3) && (a2 >= 0.3) && (a2 <= 0.4) && (a3 >= 0.4) && (a3 <= 0.5))
    pr_diagnosis_given_2= gaussian(a1)*gaussian(a2)*gaussian(a3) *pr_diagnosis_given_2;
    disp('this condition satisfy3')
end
if ((a1 >= 0.2) && (a1 <= 0.3)&&(a2 >= 0.3) && (a2 <= 0.4))||((a2 >= 0.3) &&(a2 <= 0.4)&&(a3 >= 0.4)&&(a3 <= 0.5))||((a1 >= 0.1) &&(a1 <= 0.2)&&(a3 >= 0.3)&&(a3 <= 0.4))
    pr_diagnosis_given_2=(gaussian(a1)*gaussian(a2)+gaussian(a2)*gaussian(a3)+ gaussian(a1)*gaussian(a3))*pr_diagnosis_given_2;
    disp('this condition satisfy2')
end
if ((a1 >= 0.2) && (a1 <= 0.3))||((a2 >= 0.3) && (a2 <= 0.4))||((a3 >= 0.4) && (a3 <= 0.5))
    pr_diagnosis_given_2=(gaussian(a1)+gaussian(a2)+gaussian(a3))*pr_diagnosis_given_2;
    disp('this condition satisfy1')
end

% third state  to fourth state
if ((a1 >= 0.2) && (a1 <= 0.4) && (a2 >= 0.4) && (a2 <= 0.5) && (a3 >= 0.5) && (a3 <= 0.6))
    pr_diagnosis_given_3= gaussian(a1)*gaussian(a2)*gaussian(a3) *pr_diagnosis_given_3; 
end
    if ((a1 >= 0.3) && (a1 <= 0.4)&&(a2 >= 0.4) && (a2 <= 0.5))||((a2 >= 0.4) &&(a2 <= 0.5)&&(a3 >= 0.5)&&(a3 <= 0.6))||((a1 >= 0.1) &&(a1 <= 0.2)&&(a3 >= 0.3)&&(a3 <= 0.4))
    pr_diagnosis_given_3=(gaussian(a1)*gaussian(a2)+gaussian(a2)*gaussian(a3)+ gaussian(a1)*gaussian(a3))*pr_diagnosis_given_3;
    end
    if ((a1 >= 0.3) && (a1 <= 0.4))||((a2 >= 0.4) && (a2 <= 0.5))||((a3 >= 0.5) && (a3 <= 0.6))
   
    pr_diagnosis_given_3=(gaussian(a1)+gaussian(a2)+gaussian(a3))*pr_diagnosis_given_3;
    end

 %%
 %%
pr_diagnosis_given_4_N=0.332;
pr_diagnosis_given_3_N=0.435;
pr_diagnosis_given_2_N=0.625;
pr_diagnosis_given_1_N=0.815;

state_random=  randi(100,1,3);
state_main = state_random/100
%state_main=[0.34 0.56 0.67];

a1= state_main(1,1);  %first element of random generator
a2= state_main(1,2);  %second element of random generator
a3= state_main(1,3);  %third element of random generator

if ((a1 >= 0.1) && (a1 <= 0.2) && (a2 >= 0.2) && (a2 <= 0.3) && (a3 >= 0.3) && (a3 <= 0.4))
    pr_diagnosis_given_1_N= gaussian(a1)*gaussian(a2)*gaussian(a3) *pr_diagnosis_given_1_N;
   disp('this condition satisfy3')
end
if ((a1 >= 0.1) && (a1 <= 0.2)&&(a2 >= 0.2) && (a2 <= 0.3))||((a2 >= 0.2) &&(a2 <= 0.3)&&(a3 >= 0.3)&&(a3 <= 0.4))||((a1 >= 0.1) &&(a1 <= 0.2)&&(a3 >= 0.3)&&(a3 <= 0.4))
    pr_diagnosis_given_1_N=(gaussian(a1)*gaussian(a2)+gaussian(a2)*gaussian(a3)+ gaussian(a1)*gaussian(a3))*pr_diagnosis_given_1_N;
    disp('this condition satisfy2')
end
if ((a1 >= 0.2) && (a1 <= 0.3))||((a2 >= 0.3) && (a2 <= 0.4))||((a3 >= 0.4) && (a3 <= 0.5))
    pr_diagnosis_given_1_N=(gaussian(a1)+gaussian(a2)+gaussian(a3))*pr_diagnosis_given_1_N;
    disp('this condition satisfy1')

end
  %second state
 
if ((a1 >= 0.2) && (a1 <= 0.3) && (a2 >= 0.3) && (a2 <= 0.4) && (a3 >= 0.4) && (a3 <= 0.5))
    pr_diagnosis_given_2_N= gaussian(a1)*gaussian(a2)*gaussian(a3) *pr_diagnosis_given_2_N;
    disp('this condition satisfy3')
end
if ((a1 >= 0.2) && (a1 <= 0.3)&&(a2 >= 0.3) && (a2 <= 0.4))||((a2 >= 0.3) &&(a2 <= 0.4)&&(a3 >= 0.4)&&(a3 <= 0.5))||((a1 >= 0.1) &&(a1 <= 0.2)&&(a3 >= 0.3)&&(a3 <= 0.4))
    pr_diagnosis_given_2_N=(gaussian(a1)*gaussian(a2)+gaussian(a2)*gaussian(a3)+ gaussian(a1)*gaussian(a3))*pr_diagnosis_given_2_N;
    disp('this condition satisfy2')
end
if ((a1 >= 0.2) && (a1 <= 0.3))||((a2 >= 0.3) && (a2 <= 0.4))||((a3 >= 0.4) && (a3 <= 0.5))
    pr_diagnosis_given_2_N=(gaussian(a1)+gaussian(a2)+gaussian(a3))*pr_diagnosis_given_2_N;
    disp('this condition satisfy1')
end

if ((a1 >= 0.2) && (a1 <= 0.4) && (a2 >= 0.4) && (a2 <= 0.5) && (a3 >= 0.5) && (a3 <= 0.6))
    pr_diagnosis_given_3_N= gaussian(a1)*gaussian(a2)*gaussian(a3) *pr_diagnosis_given_3_N; 
end
    if ((a1 >= 0.3) && (a1 <= 0.4)&&(a2 >= 0.4) && (a2 <= 0.5))||((a2 >= 0.4) &&(a2 <= 0.5)&&(a3 >= 0.5)&&(a3 <= 0.6))||((a1 >= 0.1) &&(a1 <= 0.2)&&(a3 >= 0.3)&&(a3 <= 0.4))
    pr_diagnosis_given_3_N=(gaussian(a1)*gaussian(a2)+gaussian(a2)*gaussian(a3)+ gaussian(a1)*gaussian(a3))*pr_diagnosis_given_3_N;
    end
    if ((a1 >= 0.3) && (a1 <= 0.4))||((a2 >= 0.4) && (a2 <= 0.5))||((a3 >= 0.5) && (a3 <= 0.6))
   
    pr_diagnosis_given_3_N=(gaussian(a1)+gaussian(a2)+gaussian(a3))*pr_diagnosis_given_3_N;
    end
%%
%%
state =1:4;
%pr_diagnosis_given_state=[pr_diagnosis_given_1 pr_diagnosis_given_2 pr_diagnosis_given_3 pr_diagnosis_given_4];
%pr_diagnosis_given_state_normal= [pr_diagnosis_given_1_N pr_diagnosis_given_2_N pr_diagnosis_given_3_N pr_diagnosis_given_4_N];
%plot(state, pr_diagnosis_given_state);
y=[pr_diagnosis_given_1 pr_diagnosis_given_1_N; pr_diagnosis_given_2 pr_diagnosis_given_2_N; pr_diagnosis_given_3 pr_diagnosis_given_3_N; pr_diagnosis_given_4 pr_diagnosis_given_4_N];
bar(y);
ylim([0 1])
title('Probability of diagnosis for a visit')
xlabel('HMM state')
ylabel('Probability [diagnosis|HMM state]')
legend('AD','Normal')
     