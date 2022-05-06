# Introduction
-------
This Matlab package implements optimization algorithms in order to simulate a biochemical process called Hydrothermal Liquefaction. 

It serves as supplementary material for the thesis project …,Ioannis Aslanoglou and you can find out more about the use of this algorithm on that paper.

It is written purely in Matlab language. It is self-contained. There is no external dependency.
This package was designed on Matlab R2020b but can run fine on MatlabR2016 or later.
# Instructions
-------
Download the package to a local folder.
Run Matlab and navigate to that local folder directory.
Run the script HTL_Opt and choose the option that you want according to the list below:
1.  Optimization of the feedstock using Matlab’s fmincon function for optimization
2. Optimization of the feedstock using Firefly Algorithm  for optimization
3. Optimization of the biocrude using Matlab’s fmincon function for optimization
4.  Optimization of the biocrude using Firefly Algorithm  for optimization

The input of this Matlab package is imported from an excel File called HTL_Data.

The first sheet contains data for the feedstock, while the second sheet contains data for the biocrude.

The user is prompted to change the input to his needs, but only change the green highlighted cells.

In sheet 3 there is also a database of compounds from which the user may choose some and copy- paste them on sheet 1.

Every time the user changes the input for biocrude data, it is necessary to sort the data based on compounds’ boiling point. 

This can be easily done by navigating to Home > Editing > Sort & Filter > Custom Sort > Options and then choose ‘Sort left to right’ and then press ‘OK’ and then choose ‘Sort by row 3’ and press ‘OK’. 

If you want to add more constraints, it is handier to do it using the Firefly Algorithm (line 32). 

Also, changing the total sum from the excel file will only change this constraint in options 1 and 3. 

The user should change it manually in the Firefly Algorithm. (options 2,4)

Also note than when you run the HTL_Opt script, the excel file should be closed.

Finally, at this time this package is mostly focused on optimizing the biocrude, so the data of the input  cannot be modified yet, but this is my near – future plans.
# Feedback
-------
If you find any bug or have any suggestion, please do file issues. I am graceful for any feedback and will do my best to improve this package.
