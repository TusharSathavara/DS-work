# Session 3: Standard Deviation

import math


# Task 1: Calculate standard deviation using a function

def calculate_standard_deviation(scores):
    if len(scores) == 0:
        return 0

    mean = sum(scores) / len(scores)

    squared_differences = [(score - mean) ** 2 for score in scores]

    variance = sum(squared_differences) / len(scores)

    standard_deviation = math.sqrt(variance)

    return round(standard_deviation, 2)


scores = [70, 80, 90, 60, 100]

print("Scores:", scores)
print("Standard Deviation:", calculate_standard_deviation(scores))


# Task 2: Analyze employee salaries

salaries = [28000, 29000, 27000, 60000, 26500, 27500]

mean_salary = sum(salaries) / len(salaries)

salary_variance = sum(
    (salary - mean_salary) ** 2 for salary in salaries
) / len(salaries)

salary_standard_deviation = math.sqrt(salary_variance)

print("\nEmployee Salaries:", salaries)
print("Mean Salary:", round(mean_salary, 2))
print("Population Variance:", round(salary_variance, 2))
print("Standard Deviation:", round(salary_standard_deviation, 2))

print("\nConclusion:")
print("The 60000 salary increases the overall salary variation.")
