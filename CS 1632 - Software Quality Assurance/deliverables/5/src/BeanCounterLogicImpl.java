import gov.nasa.jpf.vm.Verify;

import java.util.*;

import java.util.Arrays;
import java.util.Formatter;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Random;

/**
 * Code by @author Wonsun Ahn
 * 
 * <p>BeanCounterLogic: The bean counter, also known as a quincunx or the Galton
 * box, is a device for statistics experiments named after English scientist Sir
 * Francis Galton. It consists of an upright board with evenly spaced nails (or
 * pegs) in a triangular form. Each bean takes a random path and falls into a
 * slot.
 *
 * <p>Beans are dropped from the opening of the board. Every time a bean hits a
 * nail, it has a 50% chance of falling to the left or to the right. The piles
 * of beans are accumulated in the slots at the bottom of the board.
 * 
 * <p>This class implements the core logic of the machine. The MainPanel uses the
 * state inside BeanCounterLogic to display on the screen.
 * 
 * <p>Note that BeanCounterLogic uses a logical coordinate system to store the
 * positions of in-flight beans.For example, for a 4-slot machine:
 *                      (0, 0)
 *               (0, 1)        (1, 1)
 *        (0, 2)        (1, 2)        (2, 2)
 *  (0, 3)       (1, 3)        (2, 3)       (3, 3)
 * [Slot0]       [Slot1]       [Slot2]      [Slot3]
 */


public class BeanCounterLogicImpl implements BeanCounterLogic {
	// TODO: Add member methods and variables as needed
	private BeanImpl[] beansMoving; // stores each bean that is currently in the machine
	private Queue<BeanImpl> beansRemaining; // linked list for each bean that hasn't entered the machine 
	private Queue<BeanImpl>[] slots; // array that stores beans in each slot

	/**
	 * Constructor - creates the bean counter logic object that implements the core
	 * logic with the provided number of slots.
	 * 
	 * @param slotCount the number of slots in the machine
	 */

	BeanCounterLogicImpl(int slotCount) {
		// TODO: Implement
		beansMoving = new BeanImpl[slotCount];
		beansRemaining = new LinkedList<BeanImpl>();
		slots = new LinkedList[slotCount];
		// instantiate each slot to be a linked list of beans
		for (int i = 0; i < slots.length; i++) {
			slots[i] = new LinkedList<BeanImpl>();
		}
	}

	/**
	 * Returns the number of slots the machine was initialized with.
	 * 
	 * @return number of slots
	 */
	public int getSlotCount() {
		// TODO: Implement
		return slots.length;
	}
	
	/**
	 * Returns the number of beans remaining that are waiting to get inserted.
	 * 
	 * @return number of beans remaining
	 */
	public int getRemainingBeanCount() {
		// TODO: Implement
		return beansRemaining.size();
	}

	/**
	 * Returns the x-coordinate for the in-flight bean at the provided y-coordinate.
	 * 
	 * @param yPos the y-coordinate in which to look for the in-flight bean
	 * @return the x-coordinate of the in-flight bean; if no bean in y-coordinate, return NO_BEAN_IN_YPOS
	 */
	public int getInFlightBeanXPos(int yPos) {
		// TODO: Implement
		int coordinate = -1;
		// if there is a bean in the y-coordinate, return the coordinate
		if (beansMoving[yPos] != null) {
			coordinate = beansMoving[yPos].getX();
		}

		return coordinate;
	}

	/**
	 * Returns the number of beans in the ith slot.
	 * 
	 * @param i index of slot
	 * @return number of beans in slot
	 */
	public int getSlotBeanCount(int i) {
		// TODO: Implement
		return slots[i].size();
	}

	/**
	 * Calculates the average slot number of all the beans in slots.
	 * 
	 * @return Average slot number of all the beans in slots.
	 */
	public double getAverageSlotBeanCount() {
		// TODO: Implement
		int total = 0;
		double average = 0.0;

		// find the total number of beans
		for (int i = 0; i < slots.length; i++) {
			average += slots[i].size() * i;
			total += slots[i].size();
		}

		// if the total is greater than 0, divide the total by the number of slots
		if (total > 0) {
			average = (double) average / total;
		}

		return average;
	}

	/**
	 * Removes the lower half of all beans currently in slots, keeping only the
	 * upper half. If there are an odd number of beans, remove (N-1)/2 beans, where
	 * N is the number of beans. So, if there are 3 beans, 1 will be removed and 2
	 * will be remaining.
	 */
	public void upperHalf() {
		// TODO: Implement
		int total = 0;
		int index = 0; // start from the lower half

		// add up the total of the slots
		for (int i = 0; i < slots.length; i++) {
			total += slots[i].size();
		}

		// if the total is odd, if so remove (total-1)/2 beans
		if (total % 2 != 0) {
			total = (total - 1) / 2;
		} else {
			total /= 2;
		}

		for (int j = 0; j < total; j++) {
			while (slots[index].size() == 0 && slots.length > index) {
				index++;
			}
			slots[index].remove();
		}
	}

	/**
	 * Removes the upper half of all beans currently in slots, keeping only the
	 * lower half.  If there are an odd number of beans, remove (N-1)/2 beans, where
	 * N is the number of beans. So, if there are 3 beans, 1 will be removed and 2
	 * will be remaining.
	 */
	public void lowerHalf() {
		// TODO: Implement
		int total = 0;
		int index = slots.length - 1; // start from the upper half

		// add up the total of the slots
		for (int i = 0; i < slots.length; i++) {
			total += slots[i].size();
		}

		// if the total is odd, if so remove (total-1)/2 beans
		if (total % 2 != 0) {
			total = (total - 1) / 2;
		} else {
			total /= 2;
		}

		for (int j = 0; j < total; j++) {
			while (slots[index].size() == 0 && index >= 0) {
				index--;
			}
			slots[index].remove();
		}
	}

	/**
	 * A hard reset. Initializes the machine with the passed beans. The machine
	 * starts with one bean at the top. Note: the Bean interface does not have any
	 * methods except the constructor, so you will need to downcast the passed Bean
	 * objects to BeanImpl objects to be able to work with them. This is always safe
	 * by construction (always, BeanImpl objects are created with
	 * BeanCounterLogicImpl objects and BeanBuggy objects are created with
	 * BeanCounterLogicBuggy objects according to the Config class).
	 * 
	 * @param beans array of beans to add to the machine
	 */
	public void reset(Bean[] beans) {
		// TODO: Implement
		// clear the beans from the beans remaining, beans in the machine, and in the slots
	
		beansRemaining.clear();

		// clear slots and beans moving
		for (int i = 0; i < slots.length; i++) {
			beansMoving[i] = null;
			slots[i].clear();
		}
		// add the array of beans to the beans remaining
		for (int j = 0; j < beans.length; j++) {
			beansRemaining.add((BeanImpl)beans[j]);
		}

		if (beansRemaining.size() > 0) {
			beansMoving[0] = beansRemaining.remove();
			beansMoving[0].setX(0);
		} else {
			beansMoving[0] = null;
		}
	}

	/**
	 * Repeats the experiment by scooping up all beans in the slots and all beans
	 * in-flight and adding them into the pool of remaining beans. As in the
	 * beginning, the machine starts with one bean at the top.
	 */
	public void repeat() {
		// TODO: Implement
		// go through the beans in the slots and add them to the beans remaining
		for (int i = 0; i < slots.length; i++) {
			// go through the beans in-flight and add them to the beans remaining
			if (beansMoving[i] != null) {
				beansRemaining.add(beansMoving[i]); // add all the beans to beans remaining
				beansMoving[i] = null; // clear the spot
			}

			beansRemaining.addAll(slots[i]); // add all the beans to beans remaining
			slots[i].clear(); // clear the slot
		}

		if (beansRemaining.size() > 0) {
			beansMoving[0] = beansRemaining.remove();
			beansMoving[0].setX(0);
		} else {
			beansMoving[0] = null;
		}
	}

	/**
	 * Advances the machine one step. All the in-flight beans fall down one step to
	 * the next peg. A new bean is inserted into the top of the machine if there are
	 * beans remaining.
	 * 
	 * @return whether there has been any status change. If there is no change, that
	 *         means the machine is finished.
	 */
	public boolean advanceStep() {
		// TODO: Implement
		boolean advanced = false;
		BeanImpl currentBean = null;
		int coordinate = 0;

		for (int i = slots.length - 1; i >= 0; i--) {
			currentBean = beansMoving[i];

			if (currentBean != null) {
				// if it's not in the bottom slots, advance through the machine
				// else it's in one of the bottom slots, add it to the slot
				if (i != slots.length - 1) {
					currentBean.move(); // advance the bean
					beansMoving[i + 1] = currentBean;
				} else {
					coordinate = currentBean.getX(); // get the coordinate
					slots[coordinate].add(currentBean); // add the bean to the respective slot
				}
				advanced = true;
			} else if (i < slots.length - 1) {
				beansMoving[i + 1] = null;
			}
		}
		if (beansRemaining.size() <= 0) {
			beansMoving[0] = null;
		} else {
			beansMoving[0] = beansRemaining.remove();
			beansMoving[0].setX(0);
		}
		return advanced;
	}
	
	/**
	 * Number of spaces in between numbers when printing out the state of the machine.
	 * Make sure the number is odd (even numbers don't work as well).
	 */
	private int xspacing = 3;

	/**
	 * Calculates the number of spaces to indent for the given row of pegs.
	 * 
	 * @param yPos the y-position (or row number) of the pegs
	 * @return the number of spaces to indent
	 */
	private int getIndent(int yPos) {
		int rootIndent = (getSlotCount() - 1) * (xspacing + 1) / 2 + (xspacing + 1);
		return rootIndent - (xspacing + 1) / 2 * yPos;
	}

	/**
	 * Constructs a string representation of the bean count of all the slots.
	 * 
	 * @return a string with bean counts for each slot
	 */
	public String getSlotString() {
		StringBuilder bld = new StringBuilder();
		Formatter fmt = new Formatter(bld);
		String format = "%" + (xspacing + 1) + "d";
		for (int i = 0; i < getSlotCount(); i++) {
			fmt.format(format, getSlotBeanCount(i));
		}
		fmt.close();
		return bld.toString();
	}

	/**
	 * Constructs a string representation of the entire machine. If a peg has a bean
	 * above it, it is represented as a "1", otherwise it is represented as a "0".
	 * At the very bottom is attached the slots with the bean counts.
	 * 
	 * @return the string representation of the machine
	 */
	public String toString() {
		StringBuilder bld = new StringBuilder();
		Formatter fmt = new Formatter(bld);
		for (int yPos = 0; yPos < getSlotCount(); yPos++) {
			int xBeanPos = getInFlightBeanXPos(yPos);
			for (int xPos = 0; xPos <= yPos; xPos++) {
				int spacing = (xPos == 0) ? getIndent(yPos) : (xspacing + 1);
				String format = "%" + spacing + "d";
				if (xPos == xBeanPos) {
					fmt.format(format, 1);
				} else {
					fmt.format(format, 0);
				}
			}
			fmt.format("%n");
		}
		fmt.close();
		return bld.toString() + getSlotString();
	}

	/**
	 * Prints usage information.
	 */
	public static void showUsage() {
		System.out.println("Usage: java BeanCounterLogic slot_count bean_count <luck | skill> [debug]");
		System.out.println("Example: java BeanCounterLogic 10 400 luck");
		System.out.println("Example: java BeanCounterLogic 20 1000 skill debug");
	}
	
	/**
	 * Auxiliary main method. Runs the machine in text mode with no bells and
	 * whistles. It simply shows the slot bean count at the end.
	 * 
	 * @param args commandline arguments; see showUsage() for detailed information
	 */
	public static void main(String[] args) {
		boolean debug;
		boolean luck;
		int slotCount = 0;
		int beanCount = 0;

		if (args.length != 3 && args.length != 4) {
			showUsage();
			return;
		}

		try {
			slotCount = Integer.parseInt(args[0]);
			beanCount = Integer.parseInt(args[1]);
		} catch (NumberFormatException ne) {
			showUsage();
			return;
		}
		if (beanCount < 0) {
			showUsage();
			return;
		}

		if (args[2].equals("luck")) {
			luck = true;
		} else if (args[2].equals("skill")) {
			luck = false;
		} else {
			showUsage();
			return;
		}
		
		if (args.length == 4 && args[3].equals("debug")) {
			debug = true;
		} else {
			debug = false;
		}

		// Create the internal logic
		BeanCounterLogicImpl logic = new BeanCounterLogicImpl(slotCount);
		// Create the beans (in luck mode)
		BeanImpl[] beans = new BeanImpl[beanCount];
		for (int i = 0; i < beanCount; i++) {
			beans[i] = new BeanImpl(slotCount, luck, new Random());
		}
		// Initialize the logic with the beans
		logic.reset(beans);

		if (debug) {
			System.out.println(logic.toString());
		}

		// Perform the experiment
		while (true) {
			if (!logic.advanceStep()) {
				break;
			}
			if (debug) {
				System.out.println(logic.toString());
			}
		}
		// display experimental results
		System.out.println("Slot bean counts:");
		System.out.println(logic.getSlotString());
	}
}
