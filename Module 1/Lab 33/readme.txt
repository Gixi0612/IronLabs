Import data 
Check if there is any null data in dataframe
Check data.Profession.unique(), change etudiant to student, lowercase all and then capitalize this column. 
Check where in profession is null data.loc[data['Profession'].isna()] 
Check where birthyear is null data.loc[data['BirthYear'].isna()]['ClientID']
Input the value based on ClientID because there are different transactions with the same Cus ID, where some has Profession, BirthYear, some doesn't. 
find outlier in Amount plt.boxplot(data['Amount']), replace it as 0 and then  change it to the mean of Amount column
