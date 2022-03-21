
- Get dummies:
Probably the easiest and most straightforward method which can be used for multiple columns at the same time and returns a dataframe which is also clear to understand. The value 1 is returned to the spot where it fits the defined criteria.

- Label encoding:
Similar to Get dummies, but instead of returning a value '1' for each qualified location, this method encodes the categorical data with labels (1, 2, 3, ...).

- One hot encoding:
With the help of label encoding, this method returns an array with value 1 for areas that match the criteria (where categorical value is present).

- Ordinal encoding:
Mostly used for ordinal data and also returns an array with values ranging from 0 to N depending on the number of rows.
