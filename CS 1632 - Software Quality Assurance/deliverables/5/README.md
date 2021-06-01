- [CS 1632 - Software Quality Assurance](#cs-1632---software-quality-assurance)
  * [Overview](#Overview)
  * [Background](#background)
  * [Compiling and Running](#compiling-and-running)
    + [Luck Mode](#luck-mode)
    + [Skill Mode](#skill-mode)
    + [Text UI Mode](#text-ui-mode)
  * [What to do](#what-to-do)
    + [Model Checking Using JUnit](#model-checking-using-junit)
    + [Coding](#coding)
    + [Static Testing](#static-testing)
    + [Manual System Testing](#manual-system-testing)
  * [Grading](#grading)
  * [Submission](#submission)
  * [GradeScope Feedback](#gradescope-feedback)
  * [Resources](#Resources)
  
# CS 1632 - Software Quality Assurance
Spring Semester 2020

DUE: April 24, 2020 11:59 PM

This project is INDIVIDUAL WORK.  The change is due to COVID-19 and the
difficulty it imposes in working with a partner.  The project has been revised
to require half the work.  There will be an exercise 5 happening next week (see
[Syllabus](/syllabus.md) to help you out.

Also note there are NO LATE SUBMISSIONS due to the grading deadline.  

## Overview

For this final deliverable, you will develop a full-fledged
GUI program (with the help of some skeleton code), along with various tests.
Don't worry if you don't know GUI programming --- that part has already been
done for you.

All the projects so far have used some form of dynamic testing.  In this
project, we will focus on static testing.  You are still well-advised to use
all the techniques we have learned so far: test-driven development (TDD),
automated unit testing, code coverage, and manual testing to name a few.  But
you will not be required to submit a proof of testing.  What you will be graded
upon is static testing techniques such as: linting, pattern-based bug finding,
and model checking.  Also, as always, you will be graded upon the quality of
the software itself.

* IMPORTANT: You need Java 8 (1.8.0.231, preferably) to run the Java Path
  Finder model checker.  Make sure you have the correct Java version by doing
"java -version" and "javac -version" before going into the JPF section.  If you
don't have the correct version, here is a link to a folder with installation
packages for each OS:

https://drive.google.com/drive/folders/1E76H7y2nMsrdiBwJi0nwlzczAgTKKhv7

## Background

The bean counter is a device for statistics experiments devised by English
scientist Sir Francis Galton. It consists of an upright board with evenly
spaced pegs in a triangular form.  Beans are dropped from an opening at the top
of the board. Every time a bean hits a peg, it has a 50% chance of falling to
the left or to the right.  In this way, each bean takes a random path and
eventually falls into one of the slots at the bottom of the board.  After all
the beans fall through, the number of beans in each slot is counted.

See the following link for a more detailed description of the machine:
https://en.wikipedia.org/wiki/Bean_machine.

The bean counter had two contributions to statistics by demonstrating the following:
1. When the sample size is large enough, a [binomial distribution](https://en.wikipedia.org/wiki/Binomial_distribution) approaches a [bell curve](https://en.wikipedia.org/wiki/Normal_distribution).
2. It also demonstrated a phenomenon named [regression to the mean](https://en.wikipedia.org/wiki/Regression_toward_the_mean).

Regression to the mean had been (and still is) a source of numerous scientific
misconceptions.  People make conjectures all the time about all types of things
and provide reasons for it.

1. Why is my favorite sports team performing in a mediocre way when it won the championships last year?  Because my favorite player was traded.
2. Why did the crime rate in my city fall down to the national average?  Due to better policing.
3. Why did a student who did exceptionally well on the midterms perform just about average on the finals?  Because the student slacked off.

People always look for reasons for changes in data.  But often the reason
cannot be explained, because there was no reason for the change to begin with.
The change in data can just be due to a statistical anomaly called "regression
to the mean".  For example, an answer to question 3 can simply be that the
student was exceptionally lucky during the midterms (she guessed all multiple
choices and she got them all correct).  In the finals, her luck wore just off
and she just got what she deserved.  This is called regression to the mean.
When a data point is on the extremes of the bell curve, it is often not because
there is anything special about that data point, it is because the laws of
probability worked in favor of it (or against it, depending on context) for
that particular trial.  If that's the case, chances are that the data point
will move to the mean in the next trial.

Now if the exceptional score was due to skill, then the regression would not
happen unless there was a regression in skill.  The problem is, it is very hard
to tell whether something was due to luck or skill just by looking at the
results, hence the numerous misconceptions.

## Compiling and Running

The program simulates a bean machine with 10 slots at the bottom (0-9).

Let's first compile the program by running compile.bat:
```
$ compile.bat
```
Mac/Linux users, please run compile.sh.  Run the .sh extension for all .bat files that follow.

The program is executed with two commandline arguments:
```
$ java -cp bin BeanCounterGUI
Usage: java BeanCounterGUI <number of beans> <luck | skill>
Example: java BeanCounterGUI 500 luck 
```

The second argument "luck" or "skill" decides whether individual beans will use
luck or skill in navigating the bean machine.  

Let's do some exploratory testing.  You could use the class files that you have
just compiled, but the app doesn't do much at this point because the internal
logic has not yet been implemented (by you).  Instead, let's use a reference
implementation (that I wrote) named BeanCounter.jar.

### Luck Mode

In luck mode, the bean counter operates conventionally as originally built by
Galton: a bean has an equal chance of going left or right on a peg.  So where
the bean lands at the bottom is purely due to luck.  Hence, you would expect
the beans to be heavily susceptible to regression to the mean.  Try the following:

1. Run BeanCounter.jar in luck mode:
```
$ java -jar BeanCounter.jar 500 luck
```
2. Press the "Fast" button to fast-forward to the end.
3. Note the average (should be close to 4.5 = 0 + 9 / 2).
4. Press the "Upper Half" button to just take the upper half of the sample.
5. Note the average (now it should be much higher since it's the upper half).
6. Press the "Repeat" button to scoop all the beans and bring them to the top.
7. Press the "Fast" button to restart the machine.
8. Note the average is again close to 4.5.

You have just observed regression to the mean.  You took the upper half of the
class, but when they were put through the exam again, they scored just about
average.  Did they slack off in the second exam?  No, they were just no better
than the other students to begin with.

To run your own (currently incomplete) code, you will be doing:
```
$ java -cp bin BeanCounterGUI 500 luck
```

### Skill Mode

In skill mode, the beans choose direction based on pure skill.  Each bean is
assigned a skill level from 0-9 on creation according to a bell curve with
average 4.5 and standard deviation 1.5.  A skill level of 9 means the bean
always makes the "right" choices (pun intended).  That means the bean will
always go right when a peg is encountered, resulting it falling into the
rightmost 9th slot. A skill level of 0 means that the bean will always go left,
resulting it falling into the leftmost 0th slot. For the in-between skill
levels, the bean will first go right then left. For example, for a skill level
of 7, the bean will go right 7 times then go left twice.  So where the bean
lands at the bottom would be determined entirely by the skill level of the
bean.  Try the following:

1. Run BeanCounter.jar in skill mode:
```
$ java -jar BeanCounter.jar 500 skill
```
2. Press the "Fast" button to fast-forward to the end.
3. Note the average (should be close to 4.5 = 0 + 9 / 2).
4. Press the "Upper Half" button to just take the upper half of the sample.
5. Note the average (now it should be much higher since it's the upper half).
6. Press the "Repeat" button to scoop all the beans and bring them to the top.
7. Press the "Fast" button to restart the machine.
8. Note the average is exactly the same as the average noted in Step 5.

You will observe that the average does not change at all when you repeat the
experiment with the upper half of the samples.  There is no regression to the
mean because the results are pre-determined by skill level.  In this case, the
student performed well on the first exam because they were actually skilled!

Also, you will notice the slots filling sequentially one by one in the repeat
run.  This is a side-effect of the slots at the bottom being collected one by
one when the repeat button is pressed.  All the beans in one slot have the same
skill level so the beans naturally get sorted out as a result of the
collection.

To run your own (currently incomplete) code, you will be doing:
```
$ java -cp bin BeanCounterGUI 500 skill
```

### Text UI Mode

You will notice that BeanCounterLogicImpl.java has an alternate main()
method.  This main() method is used to provide a rudimentary text user
interface.  You can invoke it by doing:

```
java -cp BeanCounter.jar BeanCounterLogicImpl 10 500 luck debug
```

This is the usage information that gets printed when you don't pass any arguments:

```
Usage: java BeanCounterLogic slot_count bean_count <luck | skill> [debug]
Example: java BeanCounterLogic 10 400 luck
Example: java BeanCounterLogic 20 1000 skill debug
```

The last optional debug enables verbose output that prints the state of the
bean counter at each step.  This makes debugging easier as it is able to test
your bean counter logic in isolation from the GUI.  It also allows you to
adjust the slot count, something which is not possible with the GUI.

To run your own (currently incomplete) code, you will be doing:
```
$ java -cp bin BeanCounterLogicImpl 10 500 luck debug
```

## What to do

You are asked to fill in and modify 3 files: BeanCounterLogicImpl.java,
BeanImpl.java, BeanCounterLogicTest.java.  The first two files complete the
bean counter implementation.  The last file tests the implementation using the
Java Path Finder model checker via the JUnit framework.  Take care that you
limit your modifications to these three files as all the other files will be
ignored in your submission.  Also, take care that you do not change the method
names of pre-existing methods as GradeScope relies on them to exist.

I expect you to employ test-driven development (TDD) for this project and fully
embrace it.  I can guarantee you that it will shorten development time.  You
are going to write the tests anyway.  Why not write them at the beginning when
they will be much more useful?  I will lay down the steps, roughly in the order
you should perform them.

### Model Checking Using JUnit

Write invariant property assertions for the Java Pathfinder (JPF) model
checker.  You will do this within the JUnit framework in the
BeanCounterLogicTest.java.

Notice that I have intentionally separated out the logic part of the program
from the GUI.  This was done explicitly to make model checking easier.  Model
checking a GUI is tricky and so is a multi-threaded event-driven program like
BeanCounterGUI.  Yes, JPF can model check even multi-threaded programs (!) by
exhaustively going through all the interleavings.  But it is complicated and it
takes a long time.  So we will just check the internal logic, which is the
important part anyway.  You can run JPF by using the following script:

```
$ runJPF.bat BeanCounter.win.jpf
```

Or, if you are using Mac or Linux:

```
$ runJPF.sh BeanCounter.macos.jpf
```

What this script does is roughly the following:

1. Launch Java Path Finder and load the target main class (specified in the "target" in BeanCounter.jpf)
2. In this case, the target is TestRunner and the main method starts to run.
3. TestRunner subsequently invokes JUnit on your BeanCounterLogicTest class.

What does this mean?  It means JUnit is going to test your test cases one by
one like always using the assertions you provide, but the Java Path Finder is
going to explore all the paths your program can take while you are doing that.
So in the end, this means each of your test cases will actually be run hundreds
or thousands of times for each of the paths that JPF discovers!  As we learned,
paths in a program can diverge when a random number is generated (e.g. when
trying to decide whether a bean should fall left or right).  This way, you can
even prove nondeterministic programs correct by just trying all paths that your
program can take, something that regular JUnit testing cannot do.  

Also, paths can diverge at tester specified points using the Verify API.  The
Verify API allows the tester to verify a range of input values.  JPF explores
each of the input values as a separate path that your program can take.
Speaking of which, the first thing you should do in BeanCounterLogicTest.java
is to modify the setUp() method to insert the Verify calls afore mentioned.
The three input values relevant here are: slot count, bean count, and the
boolean value isLuck ("luck" or "skill" mode).  Once you insert the Verify
calls, JPF will explore each combination of input values.  As described in the
"// TODO" comment in the setUp() method, verify 1-5 slot count, 0-3 bean count,
and both "luck" and "skill" modes.  We will not test slot count 0 because then
it means there are no slots to receive beans and the machine basically falls
apart.  Although the range of values is not exhaustive, these are enough values
to give us confidence that our machine works, while ensuring that JPF
terminates within more or less 5 seconds to not lengthen turnaround time.

Currently, all the tests are empty save one: testReset().  That test just
contains a println statement inserted in order to demonstrate to you all the
combinations of input values JPF explores.  Initially, JPF should give you an
output that looks like this:

```
JavaPathfinder core system v8.0 (rev 471fa3b7c6a9df330160844e6c2e4ebb4bf06b6c) - (C) 2005-2014 United States Government. All rights reserved.


====================================================== system under test
TestRunner.main()

====================================================== search started: 3/28/20 3:34 AM
Failure in (slotCount=0, beanCount=0, isLucky=false):

====================================================== results
no errors detected

====================================================== statistics
elapsed time:       00:00:00
states:             new=2,visited=0,backtracked=2,end=1
search:             maxDepth=2,constraints=0
choice generators:  thread=2 (signal=0,lock=1,sharedRef=0,threadApi=0,reschedule=1), data=0
heap:               new=2624,released=1111,maxLive=1655,gcCycles=2
instructions:       71197
max memory:         245MB
loaded code:        classes=273,methods=3905

====================================================== search finished: 3/28/20 3:34 AM
```

After inserting the Verify calls, JPF should give you an output like this:
```
JavaPathfinder core system v8.0 (rev 471fa3b7c6a9df330160844e6c2e4ebb4bf06b6c) - (C) 2005-2014 United States Government. All rights reserved.


====================================================== system under test
TestRunner.main()

====================================================== search started: 3/28/20 3:39 AM
Failure in (slotCount=1, beanCount=0, isLucky=false):
Failure in (slotCount=1, beanCount=0, isLucky=true):
Failure in (slotCount=1, beanCount=1, isLucky=false):
Failure in (slotCount=1, beanCount=1, isLucky=true):
Failure in (slotCount=1, beanCount=2, isLucky=false):
...
[Truncated for brevity]
```

Please remove the println in your final submission.  Instead, you should put in
assertions that check the invariant properties described in the Javadoc comment
above each test method.  Note that these are invariant properties that hold
invariably regardless of the combination of input values that is currently
being explored.  Please use the JUnit assert API to insert the assertions as we
have been doing so far (not the Java assert keyword).  Also, I recommend you
always insert the failString that I initialized for you as the first argument
of every JUnit assert call so that you get that as part of your failure
message.  The failString contains the input values that are being currently
tested and it will tell you which combination led to the failure.

What to do when you see a failure?  Now you want to zero in on the path that
caused you the failure.  The failString tells you the combination of input
values that caused the failure, so you can temporarily comment out the Verify
API calls and replace them with those concrete input values.  Once you remove
the Verify calls, this suddenly becomes a regular JUnit class and you can test
it straight up by invoking JUnit.  You can do this in the Eclipse IDE or you
can just run the following script (runJUnit.sh for Mac or Linux):

```
$ runJUnit.bat
```

But the failure may not occur when you test with JUnit.  This can happen
because of random number generation.  You can make the test completely
deterministic by either mocking the Random object passed to Bean or you may
simply choose to temporarily seed the generator (e.g. new Random(42)).  Once
you seed the generator, it becomes deterministic, allowing you to reliably test
and debug your program.  You can try changing the seed until you find the seed
that triggers the failure.  If this doesn't work, you may have to do some
digging to find out exactly in which situation the failure occurred within JPF.
You may do this by adding more information to the failString.  The
BeanCounterLogicImpl.toString() method may come in handy to get the string
representation of the machine.  But to make this work, you need to change the
"fmt.format("%n");" statement to "fmt.format("\\n");" within that method (it's
just a glitch inside JPF, nothing more nothing less).  

Sometimes there are situations where JUnit emits a failure but the failure did
not come from an assertion, meaning the failString is not printed and just the
"null" message is shown.  This is most likely because JUnit suffered an
exception while running the tests, either in the test code or the application
source code.  To find out what happened, a Java stack trace would help a lot.
In order to add stack traces to the output, uncomment the following line inside
TestRunner.java:
```
System.out.println(f.getTrace());
```

After you write the assertions, the model checker should fail since you
haven't written the code yet.  Write your code towards satisfying the
assertions.  

_Also add at one more test case of your own that helps you verify some
invariant property_.  Add that test at the very end.  Make sure you test a new
invariant that has not yet been tested.  There are many many invariants yet to
be tested: be creative!  Remember, it has to be an invariant.  If you write a
test applicable to a specific input combination using if statements, it doesn't
count.  Make sure that the test case is well documented with a Javadoc comment
just like other methods.

Finally, note that we are not mocking the Beans objects, even though the Bean
class is an external class from the perspective of the BeanCounterLogicImpl
class that we are testing.  This is intentional.  Although in theory we could
use JPF to model check just the BeanCounterLogicImpl class by mocking the Bean
objects, in this case I made a conscious decision that I wanted to model check
the entire application.

### Coding

All the GUI coding has already been done for you, since some of you are not
familiar with Java AWT and event-driven programming.  You only need to
implement the logic of the machine.  All the parts that you have to fill in
have been commented with // TODO in the files: BeanCounterLogicImpl.java and
BeanImpl.java.  You will not need to modify any of the other files.  As you are
coding, regularly run the JPF model checker, both to check that the coded
feature was properly implemented and that you have not regressed.  Your goal in
coding should be to make those tests pass.

In order to get the bell curve in skill mode, you will have to use the
Random.nextGaussian() method.  A bell curve is synonymous with normal
distribution is synonymous with Gaussian distribution, hence the name.  Here is
the formula you should use:

```
SKILL_AVERAGE = (double) SLOT_COUNT * 0.5
SKILL_STDEV = (double) Math.sqrt(SLOT_COUNT * 0.5 * (1 - 0.5))
SKILL_LEVEL = (int) Math.round(rand.nextGaussian() * SKILL_STDEV + SKILL_AVERAGE)
```

SKILL\_AVERAGE and SKILL\_DEV are the average and standard deviation of the
skill level that would get you the normal distribution that approximates the
binomial distribution created by "luck" mode.  If you are curious about how
those values were computed, refer to this [Wikipedia section on binomial
distribution approximation](https://en.wikipedia.org/wiki/Binomial_distribution#Normal_approximation).

### Static Testing

Run the CheckStyle linter and the SpotBugs tool regularly while and after
coding.  When you are done, both tools should show a successful audit:

```
$ runCheckstyle.bat
Starting audit...
Audit done.
```

```
$ runSpotbugs.bat
The following classes needed for analysis were missing:
  org.junit.runner.JUnitCore
  org.junit.runner.Result
  org.junit.runner.notification.Failure
  BeanCounterLogicBuggy
  BeanBuggy
```

You can consider the above to be a successful audit.  The warning is just
showing that SpotBugs could not access the JUnit classes (which is a good thing
because you will see dozens of flagged "bugs" in the JUnit code base found by
SpotBugs that have nothing to do with you).

### Manual System Testing

Even after doing model checking, you still need to verify that the program
"looks" right end-to-end in the GUI.  This is hard to do using automated
testing so you will do manual testing for this.  Refer to the
[requirements.md](requirements.md) file for the features that need testing.  I
am not going to make you write a test plan for this, but you will be graded on
how closely the GUI follows the requirements as demonstrated in BeanCounter.jar

## Grading

* GradeScope autograder - 80%
* Verify API used properly - 5%
* Extra test checking new invariant - 5%
* Visual inspection of GUI application - 10%

Please review the rubric in GradeScope for details.  I reserve the right to
deduct points for any attempt to try to game GradeScope into giving you more
points.  Also, plagiarism will get you a zero for the project.

## Submission

This is an individual submission.  Do not work together with your partner in
any manner.  You are free to discuss and shared code for your exercises with
your partner (or any other student), and that is the extent to which you should
collaborate.  If you know how to do the exercises, there is no reason you
should have difficulty.

You will create a GitHub repository just for deliverable 5.  Make sure you keep
the repository *PRIVATE* so that nobody else can access your repository.  Once
you are done modifying code, don't forget to commit and push your changes to
the github repository.  Submit your GitHub repository to GradeScope at the
"Deliverable 5 GitHub" link.  Once you submit, GradeScope will run the
autograder to grade you and give feedback.  If you get deductions, fix your
code based on the feedback and resubmit.  Repeat until you don't get
deductions.

## GradeScope Feedback

It is encouraged that you submit to GradeScope early and often.  Please use the feedback you get on each submission to improve your code!

The GradeScope autograder works in 5 phases:

1. BeanCounterLogicImpl.java functionality testing  
    The purpose of this phase is to test BeanCounterLogicImpl for defects.  I
do this by running a set of JUnit tests against BeanCounterLogicImpl methods.
On a failure, read the feedback to get a hint on which situation led to the
defect.

1. CheckStyle

    This phase runs the CheckStyle tool on your source code.  Each warning will
get you a point deduction.

1. SpotBugs

    This phase runs the SpotBugs tool on your class files.  Each warning will
get you a point deduction.

1. BeanCounterLogicTest on BeanCounterLogicImpl  
    The purpose of this phase is to test BeanCounterLogicTest itself for
defects.  Assuming BeanCounterLogicImpl is defect free (as verified in phase
1.), any test failures in BeanCounterLogicTest while testing
BeanCounterLogicImpl indicate a bug in BeanCounterLogicTest.

1. BeanCounterLogicTest on BeanCounterLogicBuggy

    The purpose of this phase is to test BeanCounterLogicTest against the buggy
BeanCounterLogicBuggy implementation to see if it can find the defects inside
it.  The class BeanCounterLogicBuggy is given to you in the form of the
BeanCounterBuggy.jar file.  Since BeanCounterLogicBuggy is buggy, you expect
most of the tests to fail this time.  If BeanCounterLogicTestSolution fails a
test but BeanCounterLogicTest passes a test, then this indicates a problem (and
vice versa).  Read the feedback to get a hint on what the problem is.  You can
try invoking the main method inside BeanCounterLogicBuggy to see that something
is not quite right:

    ```
    java -jar BeanCounterBuggy.jar 20 400 luck
    ```

    Note that there are a lot of beans in the first slot for some reason.
There are other defects lurking inside that your model checker should be able
to find.  You can try running your model checker against BeanCounterLogicBuggy
using the following command:
    ```
    $ runJPFBuggy.bat BeanCounter.win.jpf
    ```
    Or, if you are using Mac or Linux:

    ```
    $ runJPFBuggy.sh BeanCounter.macos.jpf
    ```

    You should get an output that looks like this (it may not look exactly the
same depending on how you implemented your assertions but it should look
similar):
```
JavaPathfinder core system v8.0 (rev 471fa3b7c6a9df330160844e6c2e4ebb4bf06b6c) - (C) 2005-2014 United States Government. All rights reserved.


====================================================== system under test
TestRunner.main("buggy")

====================================================== search started: 3/28/20 3:24 AM
TESTING BUGGY IMPLEMENTATION

testAdvanceStepCoordinates(BeanCounterLogicTest): Failure in (slotCount=2, beanCount=1, isLucky=true):
testLowerHalf(BeanCounterLogicTest): Failure in (slotCount=2, beanCount=3, isLucky=false): expected:<2> but was:<1>
testAdvanceStepBeanCount(BeanCounterLogicTest): Failure in (slotCount=2, beanCount=3, isLucky=false): expected:<3> but was:<2>
testAdvanceStepPostCondition(BeanCounterLogicTest): Failure in (slotCount=2, beanCount=3, isLucky=false): expected:<3> but was:<2>
testUpperHalf(BeanCounterLogicTest): Failure in (slotCount=2, beanCount=3, isLucky=false): expected:<2> but was:<1>
testRepeat(BeanCounterLogicTest): Failure in (slotCount=4, beanCount=3, isLucky=false): expected:<3> but was:<2>

====================================================== results
no errors detected

====================================================== statistics
elapsed time:       00:00:07
states:             new=4155,visited=3529,backtracked=7684,end=467
search:             maxDepth=65,constraints=0
choice generators:  thread=3 (signal=0,lock=1,sharedRef=0,threadApi=0,reschedule=2), data=3834
heap:               new=383264,released=241705,maxLive=2274,gcCycles=7659
instructions:       15145859
max memory:         700MB
loaded code:        classes=339,methods=4699

====================================================== search finished: 3/28/20 3:24 AM
```    

## Resources

These links are the same ones posted at the end of the slides:

* JDK 8 installation packages:  
https://drive.google.com/drive/folders/1E76H7y2nMsrdiBwJi0nwlzczAgTKKhv7

* Java Path Finder manual:  
https://github.com/javapathfinder/jpf-core/wiki/How-to-use-JPF
http://javapathfinder.sourceforge.net/

* Java Path Finder Verify API:  
https://github.com/javapathfinder/jpf-core/wiki/Verify-API-of-JPF

* CheckStyle reference:  
https://checkstyle.sourceforge.io/checks.html  
If you don't understand a CheckStyle warning, read the corresponding entry inside google\_checks\_modified.xml under the checkstyle-jars folder and the above reference.

* SpotBugs reference:  
https://spotbugs.readthedocs.io/en/latest/bugDescriptions.html

