# Session 12 - Matrix Multiplication & Linear Regression Math Intuition

## Task 1: Matrix Multiplication

The likes matrix is:

[[100, 150],
 [200, 250]]

The comments matrix is:

[[10, 20],
 [30, 40]]

Using NumPy's matrix multiplication function, the resulting matrix is:

[[5500, 8000],
 [9500, 14000]]

Matrix multiplication combines rows from the first matrix with columns from the second matrix.

Note: This operation demonstrates matrix multiplication as requested. It is not itself a standard calculation of Instagram engagement.

## Task 2: Linear Regression Prediction

A simple linear regression equation is:

y = mx + c

Here:
- x is the input value.
- m is the slope.
- c is the intercept.
- y is the predicted output.

Python function:

```python
def linear_regression_predict(x, m, c):
    return m * x + c
