% I used ChatGPT to help me with this homework. 
% My strategy with ChatGPT is to first ask it to generate the code for me, then ask it to break down certain functions that I don't understand 
% or re-write the code in different ways. As someone who does not have a background in matlab or coding, this has helped me a lot in learning.
% I realized, however, that since ChatGPT bases its answers on previous parts of the conversation, sometimes it would get confused when I
% asked it to code the subsequent parts of the exercise. So to help with this, I used one conversation to ask it about the code and a different
% conversation to ask it to explain different functions and methods to me. 
% Both conversations are linked here:
% https://chat.openai.com/c/fa70857a-e5f6-4fb3-bdef-e7a0f28fb695
% https://chat.openai.com/c/b7ef6e58-3ddf-497d-876d-de88acdce11f

% 1. Plot the relationship between Age and Wing Length and 2. Calculate and plot the regression line. 
% Creating vectors with the data
age = [3, 4, 5, 6, 7, 8, 9, 11, 12, 14, 15, 16, 17];
wing_length = [1.4, 1.5, 2.2, 2.4, 3.1, 3.2, 3.2, 3.9, 4.1, 4.7, 4.5, 5.2, 5.0];

% Creating a scatter plot
scatter(age, wing_length, 'filled');
xlabel('Age');
ylabel('Wing Length');
title('Scatter Plot of Age vs. Wing Length');
grid on;

% Fitting a linear regression line
coefficients = polyfit(age, wing_length, 1);
slope = coefficients(1);
intercept = coefficients(2);

% Creating the line of best fit
x_values = min(age):0.1:max(age);
y_values = slope * x_values + intercept;

hold on;
plot(x_values, y_values, 'r', 'LineWidth', 2);
legend('Data Points', 'Linear Regression Line');
hold off;

% I'm sorry, I cannot figure out how to insert a plot in githib - will attend office hours on Thursday to ask.

% 3. As we can see from the plot, the slope is not 0. This means we can reject the null hypothesis that b = 0.

% 4. Calculate and plot the confidence intervals on the slope of the regression.
clc
clear all
% Data
age = [3, 4, 5, 6, 7, 8, 9, 11, 12, 14, 15, 16, 17];
wing_length = [1.4, 1.5, 2.2, 2.4, 3.1, 3.2, 3.2, 3.9, 4.1, 4.7, 4.5, 5.2, 5.0];

% Perform linear regression
coefficients = polyfit(age, wing_length, 1);

% Extract the slope and intercept
slope = coefficients(1);
intercept = coefficients(2);

% Calculate residuals
residuals = wing_length - (slope * age + intercept);

% Degrees of freedom
n = length(age);
df = n - 2;  % Since we have 2 parameters (slope and intercept)

% Calculate standard error of the estimate
mse = sum(residuals.^2) / df;
se_slope = sqrt(mse / sum((age - mean(age)).^2));

% Set the desired confidence level (e.g., 95%)
confidence_level = 0.95;

% Calculate critical t-value
alpha = 1 - confidence_level;
t_critical = tinv(1 - alpha/2, df);

% Calculate confidence interval bounds
slope_lower = slope - t_critical * se_slope;
slope_upper = slope + t_critical * se_slope;

% Create a scatter plot of the data
scatter(age, wing_length, 'b', 'filled');
hold on;  % Allow for overlaying the regression line

% Plot the regression line
x_range = min(age):max(age);
y_predicted = slope * x_range + intercept;
plot(x_range, y_predicted, 'r', 'LineWidth', 2);

% Plot the confidence intervals
y_lower = slope_lower * x_range + intercept;
y_upper = slope_upper * x_range + intercept;
plot(x_range, y_lower, 'g--', 'LineWidth', 1);
plot(x_range, y_upper, 'g--', 'LineWidth', 1);

% Label axes and add a legend
xlabel('Age');
ylabel('Wing Length');
title('Linear Regression with Confidence Intervals: Age vs. Wing Length');
legend('Data', 'Regression Line', 'Confidence Intervals');

grid on;
hold off;  % Release the hold for further plotting

% 5. Calculate r^2 (the coefficient of determination)
clc
clear all
% Data
age = [3, 4, 5, 6, 7, 8, 9, 11, 12, 14, 15, 16, 17];
wing_length = [1.4, 1.5, 2.2, 2.4, 3.1, 3.2, 3.2, 3.9, 4.1, 4.7, 4.5, 5.2, 5.0];

% Perform linear regression
coefficients = polyfit(age, wing_length, 1);

% Extract the slope and intercept
slope = coefficients(1);
intercept = coefficients(2);

% Calculate the predicted values
y_predicted = slope * age + intercept;

% Calculate the total sum of squares (TSS)
mean_wing_length = mean(wing_length);
TSS = sum((wing_length - mean_wing_length).^2);

% Calculate the residual sum of squares (RSS)
RSS = sum((wing_length - y_predicted).^2);

% Calculate R-squared
R_squared = 1 - (RSS / TSS);

% Display the R-squared value
fprintf('R-squared (Coefficient of Determination): %.4f\n', R_squared);

% 6. Calculate Pearson's r.
clc
clear all
% Data
age = [3, 4, 5, 6, 7, 8, 9, 11, 12, 14, 15, 16, 17];
wing_length = [1.4, 1.5, 2.2, 2.4, 3.1, 3.2, 3.2, 3.9, 4.1, 4.7, 4.5, 5.2, 5.0];

% Calculate Pearson's r
r = corr(age', wing_length', 'Type', 'Pearson');

% Display the Pearson's r value
fprintf("Pearson's r (correlation coefficient): %.4f\n", r);

% 7. Add some noise to the data and see how the regression changes.
clc
clear all
% Data
age = [3, 4, 5, 6, 7, 8, 9, 11, 12, 14, 15, 16, 17];
wing_length = [1.4, 1.5, 2.2, 2.4, 3.1, 3.2, 3.2, 3.9, 4.1, 4.7, 4.5, 5.2, 5.0];

% Add some random noise to the wing_length data
rng('default'); % For reproducibility
noise = randn(size(wing_length)) * 0.2; % Adjust the noise level as needed
noisy_wing_length = wing_length + noise;

% Perform linear regression on the noisy data
coefficients = polyfit(age, noisy_wing_length, 1);
slope = coefficients(1);
intercept = coefficients(2);

% Create a scatter plot of the noisy data
scatter(age, noisy_wing_length, 'b', 'filled');
hold on;

% Plot the regression line for the noisy data
x_range = min(age):max(age);
y_predicted = slope * x_range + intercept;
plot(x_range, y_predicted, 'r', 'LineWidth', 2);

% Label axes and add a legend
xlabel('Age');
ylabel('Noisy Wing Length');
title('Linear Regression with Noisy Data: Age vs. Wing Length');
legend('Noisy Data', 'Regression Line');

grid on;
hold off;

% Adding noise appears to draw the data points further away from the linear regression line and the confidence interval appears greater.
