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


# Extract columns
m_c12 = m1[:,1:]
print('\nm_c23:\n', m_c12)

# Extract rows
m_r13 = m_vstack[1:3]
print('\nm_r13:\n', m_r13)


# Apply a filter
m1_ge3 = m1 >= 3
print('\nm1_ge3:\n', m1_ge3)

# Filter using a boolean matrix (note that the result is a 1D vector)
m1_ge3b = m1[m1 >= 3]
print('\nm1_ge3b:\n', m1_ge3b)

# Count number of elements >= 3
print('\nNb of elements >= 3:\n', len(m1[m1 >= 3]))
