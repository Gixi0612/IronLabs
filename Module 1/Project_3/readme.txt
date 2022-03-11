Cleaning data on Python
- Check the columns who have the NaN values
- Create a subset who have the columns that sounds useful for the further analysis
- Check one by one the columns who have the Nan values  --> Fix it if possible 
- Check the outlier concerning the yearsofexperience and years at company
- Check again the type of all columns; make sure the numeric columns have float or int types
- For NaN base salary, bonus, stock grant value, total yearly compensation, locate all and modify the values of one based on other 3. (total yearly compensation = base + bonus + stock)
- Clean the name of company, make sure there are no incorrect names by replaceing all special characters, lowercase then capitalize. Results: 1632 unique companies return 1096 only in the end. 
- For Gender, there are some invalid values so change them to NaN
- In the end, export the subset to SQL
