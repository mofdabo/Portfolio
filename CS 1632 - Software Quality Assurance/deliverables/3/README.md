# CS 1632 - Software Quality Assurance
Spring Semester 2020

DUE: March 17, 2020 11:59 PM

## Deliverable 3

For this assignment, you and a partner will write systems-level, automated black-box tests for a web app using the Selenium IDE. 

The web app is located here: https://cs1632ex.herokuapp.com/

## Format
Everyone should have a title page with:
* Your names
* The title "CS 1632 - DELIVERABLE 3: Automated Web Testing"

For the summary, add a description of issues you faced when writing these tests and problems you would expect when using Selenium IDE in your future workplaces based on your experiences.  If any tests you wrote fail (some should!), they should be included here.

ON A SEPARATE PAGE, write the traceability matrix based on the requirements and test cases.  The test case names should be the same names you used in Selenium IDE.  Please make the test case names descriptive!

ON A SEPARATE PAGE, copy and paste the test suite execution results shown in the Log window for the entire test suite.  Make sure that each of your test cases appear once (and only once) in the log.  Please try to keep the original formatting (bold face and coloring); it just makes it easier to read.

ON A SEPARATE PAGE, write a defect report.  There should be at least 3 defects.  Each defect should contain all necessary components including REPRODUCTION STEPS, EXPECTED BEHAVIOR, OBSERVED BEHAVIOR, etc. described in Deliverable 1.  Don't forget to include the test case you used to find the defect in DESCRIPTIONS.

There is no need to include the testing script (the .side file).  It should be submitted as a separate file as part of your GitHub submission.

There should be a bare minimum of 10 tests, checking various base, edge, and corner cases.  Please do not go beyond 20 tests.  Do not focus on the number of tests too heavily; I am more concerned that you cover all the requirements and check a broad variety of cases based on equivalence classes.

## Requirements

Requirements for the application are listed in the `requirements.md` file in this directory.

Remember to check for implicit as well as explicit requirements!

You should have at least one test for each requirement.

## Defects

This is another buggy product.  You should find at least three defects and report them using the standard defect template (just like in the first deliverable).  These defects should be detected by your automated tests (i.e., there should be at least _three_ failures of your tests).

You may want to do some exploratory testing first to see what kind of issues are found before writing automated tests for them.

## Traceability Matrix

Please make a traceability matrix (just as in the first deliverable).  Tests should be identified by the name of the test case.

## Grading
* Summary and Testing concerns - 5% 
* Printout out of execution log - 10%
* Defect reports - 15%
* Traceability matrix - 10%
* Selenium IDE tests - 45%
* Defects are valid - 15%

Please review grading\_rubric.txt for details.

## Submission

1. You will create a github repository just for deliverable 3.  Add your partner as a collaborator so both of you have access.  Make sure you keep the repository *PRIVATE* so that nobody else can access your repository.

1. Please use the ReportTemplate.docx file provided in this directory to write your report.  If you don't have a .docx compatible word processor, that's perfectly fine as long as you follow the same organization.  A PDF version of the file is at ReportTemplate.pdf.  Please make sure that the intro, traceability matrix, test suite log, and defects are on seperate pages.  _Please create a file named Report.pdf for your report and upload to the github repository._  

1. _Please save your Selenium project to a file named deliverable3.side and also uploade to the github repository._

Each pairwise group will submit the deliverable *once* to GradeScope using your github repository, by *one member* of the group.  The submitting member will press the "View or edit group" link at the top-right corner of the assignment page after submission to add his/her partner.  Make sure that your partner is there, or he/she will not get a grade.

Please feel free to email me at wahn@pitt.edu or come to office hours to discuss any problems you have. 

## Resources

These links are the same ones posted at the end of the slides:

* Selenium IDE Command Reference:  
https://www.selenium.dev/selenium-ide/docs/en/api/commands

