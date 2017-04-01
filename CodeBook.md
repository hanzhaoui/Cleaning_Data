# Code Book
## The R script (run_analysis.R) performs the following to generate the tidy data set:
1. Merges the training and test sets to create combined data sets
* act: combined activity data set
* sub: sombined subject data set
* fea: combined feature data set
2. Names the merged feature data set
3. Extracts only the measurement on the mean and std for the feature data set
* fea.selected: contains only the measurement on the mean and std informatin
4. Appropriately lables the fea.selected data set
5. Names the merged activity data set
* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING
6. Create the combined tidy data set
* combined: the combined tidy data set
7. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* tidy: the second independent tidy data set
8. Write the tidy data set to a file (tidy.txt)
