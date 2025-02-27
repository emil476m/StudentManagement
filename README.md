# StudentManagement Project
This is a compulsory sql based project.

## Made by
* Emil
* Jens

## Content


#### EF Opgave 5
 We choose a destructive approach. our argument is, since its only renaming, 
 and not something bigger its minimal risk compared to removing an attribute or dropping a table.
 We can also allow ourself to do so, since this is not in a production envirement. but if we had a production running schema
 we would choose a point in time where there is the least amount of activity,
 and change relevant methods and calls reliant to the collum name. 

 If there is no point in time with a sufficiently low amount of activity, 
 we would implement the non-destructive way of renaming by making a EnrollmentV2 Model with the new name.
 We would set the deadline for complete migration to the new model to 1 month or week after the change.

#### EF Opgave 7
We have chosen destructive measures again.
The course credits references ects points.
in this measure it doesn't really matter if these are decimal or integers as students cant have any real effect on the outcome of this.
we have also chosen destructive measures, as going from decimal to integers for a course credit might have been overkill using none destructive measures.
