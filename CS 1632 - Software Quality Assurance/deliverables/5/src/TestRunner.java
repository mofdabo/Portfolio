import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;

import java.util.ArrayList;

public class TestRunner {
	/**
	 * Main method
	 *
	 * @param args IGNORED, kept for compatibility
	 */
	public static void main(String[] args) {

		if (args.length > 0 && args[0].equals("buggy")) {
			Config.setBuggyBeanCounterLogic(true);
			System.out.println("TESTING BUGGY IMPLEMENTATION\n");
		}

		ArrayList<Class> classesToTest = new ArrayList<Class>();
		boolean anyFailures = false;

		// ADD ANY CLASSES YOU WISH TO TEST HERE
		classesToTest.add(BeanCounterLogicTest.class);

		// For all test classes added, loop through and use JUnit
		// to run them.

		for (Class c : classesToTest) {
			Result r = JUnitCore.runClasses(c);

			// Print out any failures for this class.

			for (Failure f : r.getFailures()) {
				System.out.println(f.toString());
				//System.out.println(f.getTrace());
			}

			// If r is not successful, there was at least one
			// failure. Thus, set anyFailures to true - this
			// can never be set back to false (no amount of
			// successes will ever eclipse the fact that there
			// was at least one failure.

			if (!r.wasSuccessful()) {
				anyFailures = true;
			}

		}
	}
}
