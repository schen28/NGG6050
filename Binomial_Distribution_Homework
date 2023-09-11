Done in Matlab

% EXERCISE 1 
% Assume that there are 10 quanta available in a nerve terminal, and for a given 
% release event each is released with a probability of 0.2. For one such event, what 
% is the probability that 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, or 10 quanta will be released?

% The code below is based on the equation and matlab tutorial given by Josh on 
% binomial distribution

% Distribution of the number of successful outcomes for a given number 
% of Bernoulli trials in a given experiment, defined by two parameters:
% p = probability of success on each trial (constant across trials)
% n = number of trials
%
% This is also a DISCRETE distribution because by definition it only 
% takes on specific, discrete values (in this case non-negative integers 
% corresponding to the number of successes in n tries; thus, values 0:n).

% State the values for the parameters n and p
n = 10;    % Total number of available quanta
p = 0.2;   % Probability of releasing each quanta

% Define the total range of quanta available at the nerve terminal
x = 0:10;

% Create an array to store the probabilities at which each quanta will be released 
% (filling the array with zeros for now)
probabilities = zeros(1, length(x));

% Calculate the probabilities for each quanta number using binomial
% distribution equation - I learned from chatGPT that nchoosek is a
% function in matlab
for k = x
    probabilities(k+1) = nchoosek(n, k) * (p^k) * ((1 - p)^(n - k));
end

% Display the probabilities - used chatGPT to help me with this code
for i = 1:length(x)
    fprintf('Probability of %d quanta being released: %.4f\n', x(i), probabilities(i));
end

% Answers:
% Probability of 0 quanta being released: 0.1074
% Probability of 1 quanta being released: 0.2684
% Probability of 2 quanta being released: 0.3020
% Probability of 3 quanta being released: 0.2013
% Probability of 4 quanta being released: 0.0881
% Probability of 5 quanta being released: 0.0264
% Probability of 6 quanta being released: 0.0055
% Probability of 7 quanta being released: 0.0008
% Probability of 8 quanta being released: 0.0001
% Probability of 9 quanta being released: 0.0000
% Probability of 10 quanta being released: 0.0000




% EXERCISE 2
% PART 1
% Let's say you know that a given nerve terminal contains exactly 14 quanta available for release. 
% You have read in the literature that the release probability of these quanta is low, say 0.1. 
% To assess whether this value is reasonable, you run a simple experiment: activate the nerve and 
% measure the number of quanta that are released. The result is 8 quanta. What is the probability 
% that you would get this result (8 quanta) if the true probability of release really was 0.1? 

% State the values for the parameters n and p
n = 14;    % Total number of available quanta
p = 0.1;   % Probability of releasing each quanta

% We know the number of quanta released was 8, so:
k = 8;

% Calculate the probability of 8 quanta being released using binomial
% distribution equation
probability_8_quanta = nchoosek(n, k) * (p^k) * ((1 - p)^(n - k));

fprintf('Probability of observing exactly 8 quanta released if p = 0.1: %.4f\n', probability_8_quanta);
% Answer: probability_8_quanta = 1.5959e-05

% PART 2
% What about if the true release probability was much higher; say, 0.7?

n = 14;  
p = 0.7;   
k = 8;

probability_8_quanta = nchoosek(n, k) * (p^k) * ((1 - p)^(n - k));

fprintf('Probability of observing exactly 8 quanta released if p = 0.7: %.4f\n', probability_8_quanta);
% Answer: probability_8_quanta = 0.1262

% PART 3
% What about for each decile of release probability (0.1, 0.2, ... 1.0)?

% State the values for the parameters n and p
n = 14;    % Total number of available quanta
p = 0.1:1.0;   % Probabilities of releasing each quanta
k = 8;     % Number of quanta released

% Create an array to store the probabilities at which each quanta will be released 
% (filling the array with zeros for now)
probabilities = zeros(1, 10);

% Calculate the probabilities for each quanta number using binomial
% distribution equation - used chatGPT to help me with this code
for i = 1:10
    p = i/10; % Decile value of release probability
    % Calculate the probability of observing exactly 8 quanta released
    probability_8_quanta = nchoosek(n, 8) * (p^8) * ((1-p)^(n-8));
    probabilities(i) = probability_8_quanta;
end

% Display the probabilities for each decile
release_probabilities = 0.1:0.1:1.0;
for i = 1:10
    fprintf('Probability of observing exactly 8 quanta released for p=%.1f: %.4f\n', release_probabilities(i), probabilities(i));
end

% Answers:
% Probability of observing exactly 8 quanta released for p=0.1: 0.0000
% Probability of observing exactly 8 quanta released for p=0.2: 0.0020
% Probability of observing exactly 8 quanta released for p=0.3: 0.0232
% Probability of observing exactly 8 quanta released for p=0.4: 0.0918
% Probability of observing exactly 8 quanta released for p=0.5: 0.1833
% Probability of observing exactly 8 quanta released for p=0.6: 0.2066
% Probability of observing exactly 8 quanta released for p=0.7: 0.1262
% Probability of observing exactly 8 quanta released for p=0.8: 0.0322
% Probability of observing exactly 8 quanta released for p=0.9: 0.0013
% Probability of observing exactly 8 quanta released for p=1.0: 0.0000

% The value of release probability to be most the probable for 8 quanta is
% p = 0.6. 




% EXERCISE 3
% PART 1
% Let's say you know that a given nerve terminal contains exactly 14 quanta 
% available for release. You have read in the literature that the release 
% probability of these quanta is low, say 0.1. To assess whether this value 
% is reasonable, you run a simple experiment: activate the nerve and measure 
% the number of quanta that are released. The result is 8 quanta. What is the 
% probability that you would get this result (8 quanta) if the true probability 
% of release really was 0.1? What about if the true release probability was 
% much higher; say, 0.7? What about for each decile of release probability 
% (0.1, 0.2, ... 1.0)? Which value of release probability did you determine 
% to be the most probable, given your measurement?

% The following code for this exercise was written with the help of chatGPT. 
% My prompt was premised with "Imagine you are a neuroscientist studying 
% the probability that a certain number of quanta will be released at the 
% presynaptic terminal of a neuron." I then entered some details from the 
% previous exercises to add some context typed in the question for 
% exercise 3 to see what it would give me. 

% Parameters for the first measurement
n1 = 14;
p1 = 0.1;
k1 = 8;

% Parameters for the second measurement
n2 = 14;
p2 = 0.1;
k2 = 5;

% Calculate the likelihood for each measurement
likelihood1 = nchoosek(n1, k1) * (p1^k1) * ((1-p1)^(n1-k1));
likelihood2 = nchoosek(n2, k2) * (p2^k2) * ((1-p2)^(n2-k2));

% Calculate the log-likelihood for each measurement
log_likelihood1 = log(likelihood1);
log_likelihood2 = log(likelihood2);

% Calculate the total likelihood (product of likelihoods)
total_likelihood = likelihood1 * likelihood2;

% Calculate the total log-likelihood (sum of log-likelihoods)
total_log_likelihood = log_likelihood1 + log_likelihood2;

fprintf('Total Likelihood: %.8f\n', total_likelihood);
fprintf('Total Log-Likelihood: %.8f\n', total_log_likelihood);

% Answers:
% Total Likelihood: 0.00000012
% Total Log-Likelihood: -15.90474492

% PART 2
% Of course, knowing those values of the likelihood and log-likelihood is 
% not particularly useful until you can compare them to the values computed 
% for other possible values for the release probability, so you can 
% determine which value of release probability is most likely, given the 
% data. Therefore, compute the full likelihood and log-likelihood functions 
% using deciles of release probability between 0 and 1. What is the maximum 
% value?

% Number of quanta available
n1 = 14; % First measurement
n2 = 14; % Second measurement

% Create a grid of release probabilities
release_probabilities = 0:0.1:1.0;

% Initialize arrays to store likelihood and log-likelihood values
likelihoods = zeros(length(release_probabilities), 1);
log_likelihoods = zeros(length(release_probabilities), 1);

% Calculate likelihood and log-likelihood for each release probability
for i = 1:length(release_probabilities)
    p = release_probabilities(i);
    
    % Calculate likelihood for each measurement
    likelihood1 = nchoosek(n1, k1) * (p^k1) * ((1-p)^(n1-k1));
    likelihood2 = nchoosek(n2, k2) * (p^k2) * ((1-p)^(n2-k2));
    
    % Calculate log-likelihood for each measurement
    log_likelihood1 = log(likelihood1);
    log_likelihood2 = log(likelihood2);
    
    % Store likelihood and log-likelihood
    likelihoods(i) = likelihood1 * likelihood2;
    log_likelihoods(i) = log_likelihood1 + log_likelihood2;
end

% Find the release probability that maximizes likelihood and log-likelihood
max_likelihood = max(likelihoods);
max_log_likelihood = max(log_likelihoods);

% Find the corresponding release probability for max likelihood and log-likelihood
argmax_likelihood = release_probabilities(likelihoods == max_likelihood);
argmax_log_likelihood = release_probabilities(log_likelihoods == max_log_likelihood);

fprintf('Maximum Likelihood: %.8f at p = %.1f\n', max_likelihood, argmax_likelihood);
fprintf('Maximum Log-Likelihood: %.8f at p = %.1f\n', max_log_likelihood, argmax_log_likelihood);

% Answers:
% Maximum Likelihood: 0.02239647 at p = 0.5
% Maximum Log-Likelihood: -3.79885203 at p = 0.5

% PART 3
% Can you improve your estimate by computing the functions at a higher resolution?

% I can compute the likelihood and log-likelihood functions at a higher resolution
% by using more fine-grained values of release probabilities.

% Number of quanta available
n1 = 14; % First measurement
n2 = 14; % Second measurement

% Create a grid of release probabilities with higher resolution
release_probabilities = 0:0.01:1.0;

% Initialize arrays to store likelihood and log-likelihood values
likelihoods = zeros(length(release_probabilities), 1);
log_likelihoods = zeros(length(release_probabilities), 1);

% Calculate likelihood and log-likelihood for each release probability
for i = 1:length(release_probabilities)
    p = release_probabilities(i);
    
    % Calculate likelihood for each measurement
    likelihood1 = nchoosek(n1, k1) * (p^k1) * ((1-p)^(n1-k1));
    likelihood2 = nchoosek(n2, k2) * (p^k2) * ((1-p)^(n2-k2));
    
    % Calculate log-likelihood for each measurement
    log_likelihood1 = log(likelihood1);
    log_likelihood2 = log(likelihood2);
    
    % Store likelihood and log-likelihood
    likelihoods(i) = likelihood1 * likelihood2;
    log_likelihoods(i) = log_likelihood1 + log_likelihood2;
end

% Find the release probability that maximizes likelihood and log-likelihood
max_likelihood = max(likelihoods);
max_log_likelihood = max(log_likelihoods);

% Find the corresponding release probability for max likelihood and log-likelihood
argmax_likelihood = release_probabilities(likelihoods == max_likelihood);
argmax_log_likelihood = release_probabilities(log_likelihoods == max_log_likelihood);

fprintf('Maximum Likelihood: %.8f at p = %.2f\n', max_likelihood, argmax_likelihood);
fprintf('Maximum Log-Likelihood: %.8f at p = %.2f\n', max_log_likelihood, argmax_log_likelihood);

% Answers:
% Maximum Likelihood: 0.02403132 at p = 0.46
% Maximum Log-Likelihood: -3.72839733 at p = 0.46
% This code uses a finer range of release probabilities (0 to 1 in 
% increments of 0.01) to compute the likelihood and log-likelihood 
% functions. This higher resolution should provide a more accurate estimate 
% of the most likely value of the release probability.




% EXERCISE 4 - Used chatGPT for this code.
% You keep going and conduct 100 separate experiments.
% Using the results provided, what is the most likely value of p 
% (which we typically refer to as 'p-hat') which is pronounced as 
% "p-hat" and represents the maximum-likelihood estimate of a 
% parameter in the population given our sample with a resolution 
% of 0.01?

% Experimental results (Counts)
counts = [0, 0, 3, 10, 19, 26, 16, 16, 5, 5, 0, 0, 0, 0, 0];

% Create a grid of release probabilities with higher resolution
release_probabilities = 0:0.01:1.0;

% Initialize an array to store likelihood values
likelihoods = zeros(length(release_probabilities), 1);

% Calculate likelihood for each release probability
for i = 1:length(release_probabilities)
    p = release_probabilities(i);
    
    % Calculate the likelihood of the observed counts
    likelihood = prod((p.^(0:14)) .* ((1-p).^(14-(0:14))) .^ counts);
    
    % Store the likelihood
    likelihoods(i) = likelihood;
end

% Find the release probability that maximizes the likelihood
[max_likelihood, idx] = max(likelihoods);
estimated_phat = release_probabilities(idx);

fprintf('Most likely value of p (p-hat): %.2f\n', estimated_phat);

% Answer: 
% Most likely value of p (p-hat): 0.11




% EXERCISE 5 - Used chatGPT for this code. 
% Let's say that you have run an exhaustive set of experiments on this 
% synapse and have determined that the true release probability is 0.3 
% (within some very small tolerance). Now you want to test whether changing 
% the temperature of the preparation affects the release probability. So 
% you change the temperature, perform the experiment, and measure 7 quantal 
% events for the same 14 available quanta. Compute 'p-hat'. 
% Standard statistical inference now asks the question, what is the 
% probability that you would have obtained that measurement given a Null 
% Hypothesis of no effect? In this case, no effect corresponds to an 
% unchanged value of the true release probability (i.e., its value remained 
% at 0.3 even with the temperature change). What is the probability that 
% you would have gotten that measurement if your Null Hypothesis were true? 

% Parameters under the null hypothesis
n = 14;        % Total number of available quanta
p_null = 0.3;  % Null hypothesis: true release probability is 0.3
k = 7;         % Number of quanta released in the experiment

% Initialize the cumulative probability
cumulative_probability = 0;

% Calculate the probability of observing k or more events under the null hypothesis
for i = k:n
    % Calculate the binomial probability for each value of k or more
    probability_i = nchoosek(n, i) * (p_null^i) * ((1-p_null)^(n-i));
    
    % Add it to the cumulative probability
    cumulative_probability = cumulative_probability + probability_i;
end

fprintf('Probability of observing %d or more events under the null hypothesis: %.4f\n', k, cumulative_probability);

% Answer:
% Probability of observing 7 or more events under the null hypothesis: 0.0933
% Can you conclude that temperature had an effect?
% This probability is quite high (above 0.05), so I cannot reject the Null
% Hypothesis. There is insufficient evidence for me to determine whether 
% temperature had an effect. 

