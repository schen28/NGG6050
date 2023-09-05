% EXERCISE 1
% Based on the frequentist theory,
% The p-value is the probability that your null hypothesis is true. 

% EXERCISE 2 (in Matlab)
% Used ChatGPT version 3.5 
% Prompt: 
% Imagine running an HIV test with the total sample size being 1000. 
% The test has a false positive rate of 5% (0.05). 
% Assume the prior infection rates from 0 to 1 in steps of 0.1. 
% Using matlab code and bayesian theorem, what is the probability that if someone gets a positive test, that person is infected?

% Define the false positive rate
false_positive_rate = 0.05;

% Define the range of prior infection rates from 0 to 1 in steps of 0.1
prior_infection_rates = 0:0.1:1;

% Initialize an array to store the results
probabilities = zeros(size(prior_infection_rates));

% Iterate over the different prior infection rates
for i = 1:length(prior_infection_rates)
    % Get the current prior infection rate
    P_infection = prior_infection_rates(i);
    
    % Calculate the true positive rate
    P_positive_given_infection = 1 - false_positive_rate;
    
    % Calculate the true negative rate
    P_positive_given_no_infection = false_positive_rate;
    
    % Calculate the probability of no infection
    P_no_infection = 1 - P_infection;
    
    % Calculate the probability of infection given a positive test
    P_infection_given_positive = (P_positive_given_infection * P_infection) / ...
        (P_positive_given_infection * P_infection + P_positive_given_no_infection * P_no_infection);
    
    % Store the result in the array
    probabilities(i) = P_infection_given_positive;
end

% What is the probability that if someone gets a positive test, that person is infected?
% Output from code above - array of probabilities: 
% 0	0.678571428571429	0.826086956521739	0.890625000000000	0.926829268292683	0.950000000000000	0.966101694915254	0.977941176470588	0.987012987012987	0.994186046511628	1
