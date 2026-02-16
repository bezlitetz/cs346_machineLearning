import numpy as np
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression

# given two arrays for x and y 
x = [5,7,8,7,2,17,2,9,4,11,12,9,6]
y = [99,86,87,88,111,86,103,87,94,78,77,85,86]

# convert python lists to numpy arrays, faster for numerical computation, vecotized math, holds just one var type
y = np.array(y)
x = np.array(x).reshape(-1, 1) # numpy requires x to be in 2D, therefore rreshape the data organisation
# reshape is a np method 
# (-1, b): figure out how many rows are needed automatically
# (a, 1): 1 there are -1 total elements, we want 1 column
print(x)
# on numpy and x shape expectation of a column matrix
# xshape = (number_of_samples, number_of_features)
# before reshape: 1   2   3   4
# after reshape: 
# 1
# 2
# 3
# 4
# Each column = one feature
# Each row = one observation
# ex. : X = np.array([
#     [1, 5, 2],
#     [2, 3, 8],
#     [4, 6, 1] ])

# fit model
model = LinearRegression()
# the line below creates the eq of the line of best fit
model.fit(x, y) # learns parap]meters. slopes, intercepts, minimize sum of sq residials, found the lineo f best fit

# the points that we plug in to the line of best fit
y_coordRegLine = model.predict(x) # predict() returns the y-coordinates of the points on the line of best fit.

# plot
plt.scatter(x, y)           # original data scatter
plt.plot(x, y_coordRegLine)         # regression line 
plt.show()
