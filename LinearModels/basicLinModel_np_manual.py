import numpy as np # optimized math func 
import matplotlib.pyplot as plt

# given two arrays for x and y 
x = [5,7,8,7,2,17,2,9,4,11,12,9,6]
y = [99,86,87,88,111,86,103,87,94,78,77,85,86]

x = np.array(x)
y = np.array(y)

x_mean = np.mean(x)
y_mean = np.mean(y)

# NumPy automatically subtracts the scalar from each element in the array
slope = np.sum((x - x_mean)*(y - y_mean)) / np.sum((x - x_mean)**2)
# slope = covariance(x,y)/variance(x): minimizes sum of squared errors
intercept = y_mean - slope*x_mean

def func(x): # mx+b
  return slope * x + intercept

mymodel = list(map(func, x))

plt.scatter(x, y)
plt.plot(x, mymodel)
plt.show()