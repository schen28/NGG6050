% EXERCISE: I used chatGPT - the link to the coversation is found here https://chat.openai.com/c/f54b49e1-1c15-458b-b7e2-d2a8d18fdf67
% My approach with chatGPT was to look at the intital code it gave me and 
% then ask it to generate the code in different ways (e.g. without using a 
% certain function). I found that this helped me learn not only what that 
% function meant, but also how the multiple comparisons occur.

% PART ONE: In this exercise we will run through an example of 
% correcting for multiple comparisons with both the Benjamini-Hochberg 
% procedure and the more conservative Bonferroni correction.

% First, simulate multiple (say, 1000) t-tests comparing two samples 
% with equal means and standard deviations, and save the p-values. 
% Obviously, at p<0.05 we expect that ~5% of the simulations to yield 
% a "statistically significant" result (of rejecting the NULL
% hypothesis that the samples come from distributions with equal means).

% WITHOUT multiple comparisons:
% Number of hypothesis tests
num_tests = 100;

% Significance level (alpha)
alpha = 0.05;

% Store p-values
p_values = zeros(1, num_tests);

% Simulate multiple hypothesis tests without correction
for i = 1:num_tests
    % Generate random data for each test (assuming no real differences)
    data_group1 = randn(1, 100);
    data_group2 = randn(1, 100);
    
    % Perform t-test (ignoring the multiple comparisons problem)
    [~, p_value] = ttest2(data_group1, data_group2);
    p_values(i) = p_value;
end

% Identify significant results without correction
significant_results = find(p_values < alpha);

% Print the significant results
fprintf('Significant results without correction: %s\n', mat2str(significant_results));

% Without considering the multiple comparisons problem when conducting 
% a large number of hypothesis tests, I are more likely to encounter 
% false positive results.


% PART 2: Second, once you have the simulated p-values, apply both 
% methods to address the multiple comparisons problem.

% WITH multiple comparisons:
% Set random seed for reproducibility
rng(42);

% Number of simulations
num_simulations = 1000;

% Number of tests
num_tests = 1000;

% Store p-values
p_values = zeros(1, num_simulations);

% Simulate t-tests and store p-values
for i = 1:num_simulations
    sample1 = randn(1, num_tests);
    sample2 = randn(1, num_tests);
    
    % Perform the t-test using ttest2
    [~, p_value] = ttest2(sample1, sample2);
    
    p_values(i) = p_value;
end

% Benjamini-Hochberg correction
[reject_bh, ~, ~, ~] = fdr_bh(p_values, 0.05);

% Bonferroni correction
reject_bonferroni = p_values < 0.05 / num_tests;

% Calculate the number of rejected hypotheses for each correction
num_rejected_bh = sum(reject_bh);
num_rejected_bonferroni = sum(reject_bonferroni);

fprintf('Number of rejected hypotheses (Benjamini-Hochberg): %d\n', num_rejected_bh);
fprintf('Number of rejected hypotheses (Bonferroni): %d\n', num_rejected_bonferroni);




% PART 3: Third, set the sample 1 and sample 2 means to be 1 and 
% 2 respectively, and re-run the exercise. What do you notice? 
% What if you make the difference between means even greater?

% Starting off with code for the case with a modest difference 
% (1 unit) between the means:

% Number of hypothesis tests
num_tests = 100;

% Significance level (alpha)
alpha = 0.05;

% Store p-values
p_values = zeros(1, num_tests);

% Simulate multiple hypothesis tests
for i = 1:num_tests
    % Generate random data for each test with different means
    sample1 = randn(1, 100) + 1; % Mean = 1
    sample2 = randn(1, 100) + 2; % Mean = 2
    
    % Perform t-test
    [~, p_value] = ttest2(sample1, sample2);
    p_values(i) = p_value;
end

% Sort p-values in ascending order
sorted_p_values = sort(p_values);

% Apply Benjamini-Hochberg correction manually
num_hypotheses = numel(sorted_p_values);
adjusted_alpha = alpha / num_hypotheses;

reject_bh = sorted_p_values <= (1:num_hypotheses) * adjusted_alpha;

% Identify significant results with Benjamini-Hochberg correction
significant_results_bh = find(reject_bh);

% Print the significant results
fprintf('Significant results (Benjamini-Hochberg correction, modest difference): %s\n', mat2str(significant_results_bh));


% Next, looking at what would happen if the code was to set a 
% greater difference (e.g., 3 units) between the means:

% Number of hypothesis tests
num_tests = 100;

% Significance level (alpha)
alpha = 0.05;

% Store p-values
p_values = zeros(1, num_tests);

% Simulate multiple hypothesis tests
for i = 1:num_tests
    % Generate random data for each test with larger means difference
    sample1 = randn(1, 100) + 1; % Mean = 1
    sample2 = randn(1, 100) + 4; % Mean = 4 (greater difference)
    
    % Perform t-test
    [~, p_value] = ttest2(sample1, sample2);
    p_values(i) = p_value;
end

% Sort p-values in ascending order
sorted_p_values = sort(p_values);

% Apply Benjamini-Hochberg correction manually
num_hypotheses = numel(sorted_p_values);
adjusted_alpha = alpha / num_hypotheses;

reject_bh = sorted_p_values <= (1:num_hypotheses) * adjusted_alpha;

% Identify significant results with Benjamini-Hochberg correction
significant_results_bh = find(reject_bh);

% Print the significant results
fprintf('Significant results (Benjamini-Hochberg correction, greater difference): %s\n', mat2str(significant_results_bh));

% I notice that in the first case (modest difference), there are fewer 
% significant results after applying the Benjamini-Hochberg correction. 
% In the second case (greater difference), there are a greater number of 
% significant results since the difference between the means is greater. 
% From this exercise I learned that the significance of my results can
% change depending on the difference between group means and the 
% correction for multiple comparisons. If this is larger, it makes it
% easier to detect significant differences.
