# Introduction
-------
This Matlab package implements optimization algorithms in order to simulate a biochemical process called Hydrothermal Liquefaction. 

It serves as supplementary material for the thesis project "Prediction of the composition of sewage sludge biomass and products from Hydrothermal Liquefaction using different multi objective optimization algorithms",Ioannis Aslanoglou and you can find out more about the use of this algorithm on that paper.

It is written purely in Matlab language. It is self-contained. There is no external dependency.
This package was designed on Matlab R2020b but can run fine on MatlabR2016 or later.
# Instructions
-------
Download the compressed file (HTL_Final.rar) and exctract it in a local folder.
Run Matlab and navigate to that local folder directory.
Run the script HTL_Opt and choose the option that you want according to the list below:
1. Optimization using SQP algorithm
2. Optimization using Firefly algorithm
3. Optimization using Least Squares algorithm
4. Optimization using PSO algorithm

The input of this Matlab package is imported from an excel File called HTL_Data.

The sixth sheet contains data for the feedstock, while the seventh sheet contains data for the biocrude and the ninth sheet contains data for the upgraded biocrude. 

The user is prompted to change the input to his needs, but ONLY THE GREEN HIGHLIGHTED CELLS in sheets 6,7,9.

In sheet 8 there is also a database of compounds from which the user can choose.

Every time the user changes the input for biocrude data, it is necessary to sort the data based on compounds’ boiling point. 

This can be easily done by navigating to Home > Editing > Sort & Filter > Custom Sort > Options and then choose ‘Sort left to right’ and then press ‘OK’ and then choose ‘Sort by row 3’ and press ‘OK’. 

If you want to add more constraints, it is handier to do it using the Firefly Algorithm (line 22) or for better results through F_In/Out/Up but be carefull to express these constraints as relative differences squared . 

Also note than when you run the HTL_Opt script, the excel file should be closed.

Finally, at this time this package is mostly focused on optimizing the biocrude, so the data of the biomass cannot be modified yet, but this is my near – future plans.
Sheets 1,2,3,4 display the concentration results of each component for each occasion respectively, while Sheet 5 sums up and compares the results from each algorithm.
The last sheet contains the experimental data used for plotting the TBP curves.
# Feedback
-------
If you find any bug or have any suggestion, please do file issues. I am graceful for any feedback and will do my best to improve this package.

# Contact
-------
john dot as dot 1999 at gmail dot com

# License
-------
[MIT](https://choosealicense.com/licenses/mit/)
