import gov.nasa.jpf.annotation.FilterField;

import java.util.Random;

/**
 * Code by @author Wonsun Ahn
 * 
 * <p>
 * Bean: Each bean is assigned a skill level from 0-9 on creation according to a
 * normal distribution with average SKILL_AVERAGE and standard deviation
 * SKILL_STDEV. The formula to calculate the skill level is:
 * 
 * <p>
 * SKILL_AVERAGE = (double) SLOT_COUNT * 0.5
 * SKILL_STDEV = (double) Math.sqrt(SLOT_COUNT * 0.5 * (1 - 0.5))
 * SKILL_LEVEL = (int) Math.round(rand.nextGaussian() * SKILL_STDEV + SKILL_AVERAGE)
 * 
 * <p>
 * A skill level of 9 means it always makes the "right" choices (pun intended)
 * when the machine is operating in skill mode ("skill" passed on command line).
 * That means the bean will always go right when a peg is encountered, resulting
 * it falling into slot 9. A skill evel of 0 means that the bean will always go
 * left, resulting it falling into slot 0. For the in-between skill levels, the
 * bean will first go right then left. For example, for a skill level of 7, the
 * bean will go right 7 times then go left twice.
 * 
 * <p>
 * Skill levels are irrelevant when the machine operates in luck mode. In that
 * case, the bean will have a 50/50 chance of going right or left, regardless of
 * skill level. The formula to calculate the direction is: rand.nextInt(2). If
 * the return value is 0, the bean goes left. If the return value is 1, the bean
 * goes right.
 */

public class BeanImpl implements Bean {
	// TODO: Add member methods and variables as needed
	private static final double SKILL_AVERAGE = 4.5; //(double) MainPanel.SLOT_COUNT * 0.5;
	private static final double SKILL_STDEV = 1.5; //(double) Math.sqrt(MainPanel.SLOT_COUNT * 0.5 * (1 - 0.5)); 

	private Random random; // random variable
	
	private boolean luckMode; // whether the bean is in luck mode
	private int numOfSlots; // number of slots in the machine
	private int direction; // direction the machine goes
	private int skillLevel; // skill level
	
	private int coordinate; // x coordinate of the bean
	private int moves; // how many more right moves the bean has

	/**
	 * Constructor - creates a bean in either luck mode or skill mode.
	 * 
	 * @param slotCount the number of slots in the machine
	 * @param isLuck whether the bean is in luck mode
	 * @param rand   the random number generator
	 */
	BeanImpl(int slotCount, boolean isLuck, Random rand) {
		// TODO: Implement
		numOfSlots = slotCount;
		luckMode = isLuck;
		random = rand;

		// asssign each bean a skill level
		skillLevel = (int) Math.round(rand.nextGaussian() * SKILL_STDEV + SKILL_AVERAGE);

		if (skillLevel > 9) {
			skillLevel = 9;
		}
		if (skillLevel < 0) {
			skillLevel = 0;
		}

		coordinate = 0;
		moves = skillLevel;
	}

	/**
	 * Method - move's the bean either left or right
	 * 
	 * @return true if moving to the right, false if moving to the left
	*/
	public boolean move() {

		boolean movedTo = false;

		// if the machine is in luck mode (does not use skill level)
		if (luckMode) {
			direction = random.nextInt(2);
			
			// if the direction is 0, then move to the left (x doesnt change)
			if (direction == 0) {
				movedTo = false;
			} else {
				movedTo = true;
				coordinate++;
			}
		} else {
			// if the amount of moves remaining is greater than 0, move to the right
			if (moves > 0) {
				movedTo = true;
				coordinate++; // increase the x coordinate
				moves--; // subtract from the available moves
			} else {
				movedTo = false;
			}
		}
		
		return movedTo;
	}

	/**
	 * Method - get's the bean's x-coordinate
	 * @return the x-coordinate of the bean
	*/ 
	public int getX() {
		return coordinate;
	}

	/**
	 * Method - set's the bean's x-coordinate
	 * @param x the integer to set x
	*/ 
	public void setX(int x) {
		coordinate = x;
		moves = skillLevel;
	}

	/**
	 * Method - get's the number of slots
	 * @return the number of slots in the machine
	*/ 
	public int getSlotCount() {
		return numOfSlots;
	}

}