# CS 1632 - Software Quality Assurance
Spring Semester 2020

DUE: March 31, 2020 11:59 PM

Revised deadline due to COVID-19.  This is to give you flexibility in scheduling.  The final project will be relased soon.  Don't put this off to the last moment!

## Deliverable 4

For this assignment, you (NOT a group) will profile a Conway's Game of Life simulation, and improve its performance by refactoring several methods (to be determined by the results of the profiling).  This will consist of several parts:

1. Profiling (before) to determine which method is the most CPU-intensive
2. Adding pinning tests (in the form of JUnit tests) to show that the functionality is unchanged by your modifications
2. Refactoring the method to be more performant while making sure your pinning tests still pass
3. Profiling (after) showing that your rewrite helped make your method more performant

The code is available under the src/ directory.

There are no partners for this deliverable.  Please do not work together and please do not share your code.

## How to Run SlowLifeGUI

1. Running GameOfLife. For Windows do (for running SlowLifeGUI with argument 5):
    ```
    run.bat 5
    ```
    For Mac / Linux do (for running SlowLifeGUI with argument 5):
    ```
    bash run.sh 5
    ```
1. Running the TestRunner on GameOfLifePinningTest. For Windows do:
    ```
    runTest.bat
    ```
    For Mac / Linux do:
    ```
    bash runTest.sh
    ```    

Alternatively, I've created an Eclipse project for you so you can use Eclipse to import the existing project.

## What do do

The program is an implementation of Conway's Game of Life (https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life).  You can change the state of a cell (from living to dead) by clicking on one of the buttons.  Cells which are currently alive have an X and a red background; cells that are dead now, but were at any point alive during the current run, will have a green background.

There are several other buttons which invoke different features:

1. Run - this will run one iteration of the Game of Life
2. Run Continuous - This will run iterations until you press the Stop button.
3. Stop - This will stop the current "Run Continuous" run.  It will have no effect if the program is not running continuously already.
4. Write - This will write the state of the system to a backup file, to be loaded later.
5. Undo - This will undo the previous iteration.  It will only work for one iteration (that is, you cannot do multiple undos to get back multiple iterations).
6. Load - This will load a previously-saved backup file (created using the Write button) to the current world.
7. Clear - This will clear the current world.

The application accepts one command line argument, specifying the size of the world (e.g., if you enter 10, then you will create a 10 x 10 world).

### Profiling using VisualVM

For the purposes of performance testing, we will focus on a 5 X 5 world.  For the initial pattern, we will use the "blinker" pattern shown in:  
https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life#Examples_of_patterns  
The actual pattern GIF is at:  
https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life#/media/File:Game_of_life_blinker.gif  
We will start from the vertical bar on a 5X5 matrix as shown in the GIF.

For an actual full performance test suite, we would have to try multiple world
sizes and multiple patterns but for the purposes of this deliverable, we will
focus on performance debugging only the above scenario.  As it happens, once we
debug the above scenario, the application will start running quickly for all
scenarios.

There are exactly THREE major performance issues with THREE methods in the
code.  They could be in any feature of the program!  I recommend you try
exploratory testing to try out different features to determine which features
may have performance problems before profiling the application.  There are TWO
features that have problems (that is, two buttons).  The three performance
problems are dispersed in those two features.

In order to determine the "hot spots" of the application, you will need to run
a profiler such as VisualVM (download at https://visualvm.github.io/).  Using a
profiler, determine the THREE methods you can modify to measurably increase the
speed of the application without modifying behavior.  Refer to Exercise 4 for a
detailed explanation of how to use VisualVM to profile an application.

Now there is one more step that you have to do on VisualVM not explained in
Exercise 4: you need to replace "GameOfLife" with "*" in the "Profile classes:"
window on the right before pressing on the "CPU" button to start profiling.
This instructs VisualVM to not only the GameOfLife class (the class with the
main method), but all classes in the application.  You did not need to do this
for the Exercise 4 MonkeySim application because it was single-threaded
application.  All code in a single-threaded application execute starting from
the main method, so the default behavior of VisualVM to instrument starting
from the main method class was just fine.  GameOfLife is a GUI application and
in a Java GUI application, there are multiple event handler threads running in
the background to handle events like button presses concurrently with the
application.  In this case, the code for these threads do not start from the
main method.

### Pinning Tests

Before doing refactoring any method, you should create "pinning tests" (as
described in the section on legacy code earlier - please review the slides on
Writing Testable Code if you need a refresher).  These pinning tests should
check that the behavior of a modified method was not changed by your refactor.
The methods should work EXACTLY the same as before, except they should be
faster and take up less CPU time.  *There should be at least one pinning test
per method refactored.*

In general, a pinning test doesn't necessarily have to be a unit test; it can
be an end-to-end test that you slap on quickly for the purposes of refactoring
(without spending the effort to localize tests by mocking external objects).
The end-to-end pinning test is then gradually refined into more high quality
unit tests. Sometimes this 2-step process is necessary because sometimes you
cannot write high quality unit tests before refactoring to make the code more
testable (e.g. via dependency injection).  So you need a temporary end-to-end
pinning test to protect the code base meanwhile.
 
For this deliverable, there is no reason you cannot write unit tests from the
get-go for pinning tests as the dependency injection(s) has already been done
for you.  You are required to localize each pinning unit test within the tested
class as we did for Deliverable 2 (meaning it should not exercise any code from
external classes). You will have to use Mockito mock objects to achieve this.
Also, you may have to use behavior verification instead of state verification
to test some methods because the state change happens within a mocked external
object.  Remember that you can use behavior verification only on mocked objects
(technically, you can use Mockito.verify on real objects too using something
called a Spy, but you wouldn't need to go to that length for this deliverable).
You will get point deductions if you don't use mock objects and behavior
verification appropriately.

You will write all your pinning tests in the class GameOfLifePinningTest by
completing the TODOs.  Please heed the comments.  Note that even though the
class is named GameOfLifePinningTest, the methods you test will not necessarily
come from the GameOfLife class.  You will create whatever objects from whatever
classes are necessary to test the three refactored methods.

## Report Format

Please use the ReportTemplate.docx file provided in this directory to write
your report.  If you don't have a .docx compatible word processor, that's
perfectly fine as long as you follow the same organization.  A PDF version of
the file is at ReportTemplate.pdf.  Please keep the page separation.

The report should have a title page with:
* Your name

ON A SEPARATE PAGE, write a brief report on the first feature you optimized.  Write the name of the feature, the methods you refactored, and a VisualVM screenshot of method "Hot spots" *after* the refactoring.  Please only include the "Hot spots" window in the interest of space.

ON A SEPARATE PAGE, write a brief report on the second feature you optimized.  Write the name of the feature, the methods you refactored, and a VisualVM screenshot of method "Hot spots" *after* the refactoring.  Please take care not to include any other feature in the profile (including the first feature).

## Grading
* Report - 10%
* My performance tests pass (autograder) - 45%
* My pinning tests pass (autograder) - 15%
* Your pinning tests pass (autograder) - 15%
* Your pinning tests are written correctly - 15%

Please read grading_rubric.txt before submitting!

Note that 75% of your grade (besides the report) will be graded by GradeScope autograding.  However, adjustments to your autograded score may follow if you make a bad faith attempt at tricking the autograder (e.g. write a pinning test that does not properly test the method you are refactoring).

## Submission

This is an individual submission.  Do not work together with your partner in
any manner.  You are free to discuss and shared code for your exercises with
your partner (or any other student), and that is the extent to which you should
collaborate.  If you know how to do the exercises, there is no reason you
should have difficulty.

You will do two submissions for this deliverable.

1. You will create a github repository just for deliverable 4.  Make sure you keep the repository *PRIVATE* so that nobody else can access your repository.  This applies to all future submissions for this course.  Once you are done modifying code, don't forget to commit and push your changes to the github repository.  When you are done, submit your github repository to GradeScope at the "Deliverable 4 GitHub" link.  Once you submit, GradeScope will run the autograder to grade you and give feedback.  If you get deductions, fix your code based on the feedback and resubmit.  Repeat until you don't get deductions.

1. Submit your report to GradeScope at the "Deliverable 4 Report" link.

## GradeScope Feedback

It is encouraged that you submit to GradeScope early and often.  Please use the
feedback you get on each submission to improve your code!

The GradeScope autograder works in 3 phases:

1. GameOfLife method performance tests (45.0):
   I run performance tests on each of the three methods you should optimize.  If any of those methods time out after 10 ms, you get a -15 deduction.

1. GameOfLife method pinning tests (15.0):
   I run my own pinning tests on each of the three methods you should optimize.  These pinning tests pass without you having to do anything (obviously because they are meant to test existing behavior of legacy code).  And they should stay that way.  If any of the pinning tests fail, you get a -5 deduction.

1. GameOfLifePinningTest method tests (15.0):
   I run the pinning tests you wrote (GameOfLifePinningTest) on your implementation.  If any of the pinning tests fail, you get a -5 deduction.

## Resources

* VisualVM Download:
https://visualvm.github.io/download.html

* VisualVM Documentation:
https://visualvm.github.io/documentation.html

Method profiling is not the only thing that VisualVM knows how to do.  It can
also profile overall CPU usage, heap memory usage, thread creation/termination,
class loading/unloading, Java just-in-time compiler activity, etc.  It can also
profile heap memory in a detailed way to show which types of objects are
filling the memory and where their allocation sites were.  And needless to say,
VisualVM is not the only profiling tool out there.

In the unlikely case you can't find what you are looking for in existing
profilers, you can even write your own profiler using the Java Virtual Machine
Tool Interface (JVMTI).  JVMTI is what was used to build VisualVM.

* Creating a Debugging and Profiling Agent with JVMTI
https://www.oracle.com/technical-resources/articles/javase/jvmti.html

* JVMTI Reference
https://docs.oracle.com/javase/8/docs/platform/jvmti/jvmti.html
