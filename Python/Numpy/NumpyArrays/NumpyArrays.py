# NumpyArrays
# Learning numpy arrays
# 2018-02-14    PV


import numpy as np

m1 = np.array([[1, 2, 3],[4, 5, 6]])
m2 = np.array([[7, 8, 9],[10, 11, 12]])

print('m1:\n',m1)
print('m2:\n',m2)


# np.concatenate is the most versatile function
m_conc_axis0 = np.concatenate((m1, m2))
m_conc_axis1 = np.concatenate((m1, m2), axis=1)

print('\nm_conc_axis0:\n', m_conc_axis0)
print('m_conc_axis1:\n', m_conc_axis1)


m_vstack = np.vstack((m1, m2))  # Same as concatenation on 1st axis for 2D arrays
print('\nm_vstack:\n', m_vstack)


m_hstack = np.hstack((m1, m2))  # Same as concatenation on 2nd axis for 2D arrays
print('\nm_hstack:\n', m_hstack)



# Stacks 1D arrays in a 2D array
m_column_stack = np.column_stack((range(0,5), range(10,15), range(20,25)))
print('\nm_column_stack:\n', m_column_stack)

m_row_stack = np.row_stack((range(0,5), range(10,15), range(20,25)))
print('\nm_row_stack:\n', m_row_stack)

