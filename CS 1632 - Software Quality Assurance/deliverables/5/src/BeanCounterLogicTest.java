import static org.junit.Assert.*;

import gov.nasa.jpf.vm.Verify;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import java.util.Random;

/**
 * Code by @author Wonsun Ahn
 * 
 * <p>Uses the Java Path Finder model checking tool to check BeanCounterLogic in
 * various modes of operation. It checks BeanCounterLogic in both "luck" and
 * "skill" modes for various numbers of slots and beans. It also goes down all
 * the possible random path taken by the beans during operation.
 */

public class BeanCounterLogicTest {
	private static BeanCounterLogic logic; // The core logic of the program
	private static Bean[] beans; // The beans in the machine
	private static String failString; // A descriptive fail string for assertions

	private static int slotCount; // The number of slots in the machine we want to test
	private static int beanCount; // The number of beans in the machine we want to test
	private static boolean isLuck; // Whether the machine is in "luck" or "skill" mode

	/**
	 * Sets up the test fixture.
	 */
	@BeforeClass
	public static void setUp() {
		/*
		 * TODO: Use the Java Path Finder Verify API to generate choices for slotCount,
		 * beanCount, and isLuck: slotCount should take values 1-5, beanCount should
		 * take values 0-3, and isLucky should be either true or false. For reference on
		 * how to use the Verify API, look at:
		 * https://github.com/javapathfinder/jpf-core/wiki/Verify-API-of-JPF
		 */
		slotCount = Verify.getInt(1,5);
		beanCount = Verify.getInt(0,3);
		isLuck = Verify.getBoolean();
		// Create the internal logic
		logic = BeanCounterLogic.createInstance(slotCount);
		// Create the beans
		beans = new Bean[beanCount];
		for (int i = 0; i < beanCount; i++) {
			beans[i] = Bean.createInstance(slotCount, isLuck, new Random());
		}

		// A failstring useful to pass to assertions to get a more descriptive error.
		failString = "Failure in (slotCount=" + slotCount + ", beanCount=" + beanCount
				+ ", isLucky=" + isLuck + "):";
	}

	/**
	 * Tear down after each test.
	 */
	@AfterClass
	public static void tearDown() {
		logic = null;
		beans = null;
		failString = "";

		slotCount = 0;
		beanCount = 0;
		isLuck = false;
	}

	/**
	 * Test case for void void reset(Bean[] beans).
	 * Preconditions: None.
	 * Execution steps: Call logic.reset(beans).
	 * Invariants: If beanCount is greater than 0,
	 *             remaining bean count is beanCount - 1
	 *             in-flight bean count is 1 (the bean initially at the top)
	 *             in-slot bean count is 0.
	 *             If beanCount is 0,
	 *             remaining bean count is 0
	 *             in-flight bean count is 0
	 *             in-slot bean count is 0.
	 */
	@Test
	public void testReset() {
		// TODO: Implement
		int flightSum = 0;
		int remainingSum = 0;
		int slotSum = 0;

		logic.reset(beans);

		// if beanCount is greater than 0
		if (beanCount > 0) {
			remainingSum = logic.getRemainingBeanCount();
			assertEquals(remainingSum, beanCount - 1); // remaining bean count is beanCount - 1
			
			// in-slot bean count is 0, for each slot
			for (int i = 0; i < slotCount; i++) {
				assertEquals(logic.getSlotBeanCount(i), 0);
				slotSum += logic.getSlotBeanCount(i);
			}

			flightSum = beanCount - slotSum - remainingSum;
			assertEquals(flightSum, 1); // in-flight bean count is 1
		} else if (beanCount == 0)	{
			remainingSum = logic.getRemainingBeanCount();
			assertEquals(remainingSum, 0); // remaining bean count is 0
			
			
			// in-slot bean count is 0, for each slot
			for (int i = 0; i < slotCount; i++) {
				assertEquals(logic.getSlotBeanCount(i), 0);
				slotSum += logic.getSlotBeanCount(i);
			}

			flightSum = beanCount - slotSum - remainingSum;
			assertEquals(flightSum, 0);  // in-flight bean count is 0
		}
	}

	/**
	 * Test case for boolean advanceStep().
	 * Preconditions: None.
	 * Execution steps: Call logic.reset(beans).
	 *                  Call logic.advanceStep() in a loop until it returns false (the machine terminates).
	 * Invariants: After each advanceStep(),
	 *             all positions of in-flight beans are legal positions in the logical coordinate system.
	 */
	@Test
	public void testAdvanceStepCoordinates() {
		// TODO: Implement
		logic.reset(beans);

		// loops until it returns false
		while (logic.advanceStep()) {
			for (int i = 0; i < slotCount; i++) {
				assertTrue(logic.getInFlightBeanXPos(i) <= i);
			}
		}
	}

	/**
	 * Test case for boolean advanceStep().
	 * Preconditions: None.
	 * Execution steps: Call logic.reset(beans).
	 *                  Call logic.advanceStep() in a loop until it returns false (the machine terminates).
	 * Invariants: After each advanceStep(),
	 *             the sum of remaining, in-flight, and in-slot beans is equal to beanCount.
	 */
	@Test
	public void testAdvanceStepBeanCount() {
		// TODO: Implement
		logic.reset(beans);

		int sum = 0;
		int remainingSum = 0;
		int flightSum = 0;
		int slotSum = 0;

		while (logic.advanceStep()) {
			sum = 0;
			remainingSum = 0;
			flightSum = 0;
			slotSum = 0;
			
			remainingSum = logic.getRemainingBeanCount(); // sum of remaining

			for (int i = 0; i < slotCount; i++) {
				slotSum += logic.getSlotBeanCount(i); // sum of in-slot 
			}

			flightSum = beanCount - slotSum - remainingSum; // sum of in-flight
			
			sum = remainingSum + slotSum + flightSum; // total sum of all beans

			assertEquals(beanCount, sum);
		}
	}

	/**
	 * Test case for boolean advanceStep().
	 * Preconditions: None.
	 * Execution steps: Call logic.reset(beans).
	 *                  Call logic.advanceStep() in a loop until it returns false (the machine terminates).
	 * Invariants: After the machine terminates,
	 *             remaining bean count is 0
	 *             in-flight bean count is 0
	 *             in-slot bean count is beanCount.
	 */
	@Test
	public void testAdvanceStepPostCondition() {
		// TODO: Implement
		int remainingSum = 0;
		int slotSum = 0;

		logic.reset(beans);
		while (logic.advanceStep()) {
			// loop until it returns false
		}
		
		remainingSum = logic.getRemainingBeanCount();
		
		for (int i = 0; i < slotCount; i++) {
			slotSum += logic.getSlotBeanCount(i);
		}

		int flightSum = beanCount - slotSum - remainingSum;
		
		assertEquals(remainingSum, 0); // remaining bean count is 0
		assertEquals(flightSum, 0); // in-flight bean count is 0
		assertEquals(slotSum, beanCount); // in-slot bean count is beanCount
	
	}
	
	/**
	 * Test case for void lowerHalf()().
	 * Preconditions: None.
	 * Execution steps: Call logic.reset(beans).
	 *                  Call logic.advanceStep() in a loop until it returns false (the machine terminates).
	 *                  Call logic.lowerHalf().
	 * Invariants: After calling logic.lowerHalf(),
	 *             slots in the machine contain only the lower half of the original beans.
	 *             Remember, if there were an odd number of beans, (N+1)/2 beans should remain.
	 *             Check each slot for the expected number of beans after having called logic.lowerHalf().
	 */
	@Test
	public void testLowerHalf() {
		// TODO: Implement
		int firstSum = 0;
		int secondSum = 0;

		logic.reset(beans);
		while (logic.advanceStep()) {
			// loop until if returns false
		}

		for (int i = 0; i < slotCount; i++) {
			firstSum += logic.getSlotBeanCount(i);
		}

		// if the total is odd, (total + 1)/2 should remain
		if (firstSum % 2 != 0) {
			firstSum = (firstSum + 1) / 2;
		} else {
			firstSum /= 2;
		}

		logic.lowerHalf();

		for (int i = 0; i < slotCount; i++) {
			secondSum += logic.getSlotBeanCount(i);
		}

		assertEquals(firstSum, secondSum);
	}
	
	/**
	 * Test case for void upperHalf().
	 * Preconditions: None.
	 * Execution steps: Call logic.reset(beans).
	 *                  Call logic.advanceStep() in a loop until it returns false (the machine terminates).
	 *                  Call logic.upperHalf().
	 * Invariants: After calling logic.upperHalf(),
	 *             slots in the machine contain only the upper half of the original beans.
	 *             Remember, if there were an odd number of beans, (N+1)/2 beans should remain.
	 *             Check each slot for the expected number of beans after having called logic.upperHalf().
	 */
	@Test
	public void testUpperHalf() {
		// TODO: Implement
		int firstSum = 0;
		int secondSum = 0;

		logic.reset(beans);
		while (logic.advanceStep()) {
			// loop until if returns false
		}
		
		for (int i = 0; i < slotCount; i++) {
			firstSum += logic.getSlotBeanCount(i);
		}

		// if the total is odd, (total + 1)/2 should remain
		if (firstSum % 2 != 0) {
			firstSum = (firstSum + 1) / 2;
		} else {
			firstSum /= 2;
		}

		logic.upperHalf();

		for (int i = 0; i < slotCount; i++) {
			secondSum += logic.getSlotBeanCount(i);
		}

		assertEquals(firstSum, secondSum);
	}
	
	/**
	 * Test case for void repeat().
	 * Preconditions: None.
	 * Execution steps: Call logic.reset(beans).
	 *                  Call logic.advanceStep() in a loop until it returns false (the machine terminates).
	 *                  Call logic.repeat();
	 *                  Call logic.advanceStep() in a loop until it returns false (the machine terminates).
	 * Invariants: If the machine is operating in skill mode,
	 *             bean count in each slot is identical after the first run and second run of the machine. 
	 */
	@Test
	public void testRepeat() {
		// TODO: Implement
		int firstRun = 0; // tracks bean count after first run
		int secondRun = 0; // tracks bean count after second run

		logic.reset(beans);
		while (logic.advanceStep()) {
			// loop until it returns false		
		}

		// add up all the beans in each slot
		for (int i = 0; i < slotCount; i++) {
			firstRun += logic.getSlotBeanCount(i);
		}

		logic.repeat();
		while (logic.advanceStep()) {
			// loop until it returns false
		}
		// add up all the beans in each slot
		for (int i = 0; i < slotCount; i++) {
			secondRun += logic.getSlotBeanCount(i);
		}

		// if the machine is in skill mode
		if (!isLuck) {
			assertEquals(firstRun, secondRun);
		}
	}

	/**
	 * Test case for void getAverageSlotBeanCount().
	 * Preconditions: None.
	 * Execution steps: Call logic.reset(beans).
	 *                  Call logic.advanceStep() in a loop until it returns false (the machine terminates).
	 *					Call logic.repeat();
	 *                  Call logic.advanceStep() in a loop until it returns false (the machine terminates).
	 * Invariants: If the machine is operating in skill mode,
	 * 			   the average bean count is identical after the first run 
	 * 			   and second run of the machine.
	 */
	@Test
	public void testAverageSlotBeanCount() {
		// TODO: Implement
		logic.reset(beans);
		while (logic.advanceStep()) {
			// loop until it returns false		
		}

		double firstRun = logic.getAverageSlotBeanCount();

		// TODO: Implement
		logic.repeat();
		while (logic.advanceStep()) {
			// loop until it returns false		
		}

		double secondRun = logic.getAverageSlotBeanCount();

		// if the machine is in skill mode
		if (!isLuck) {
			assertEquals(firstRun, secondRun);
		}
	}

}
