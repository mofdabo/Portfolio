import org.junit.*;
import org.junit.runners.MethodSorters;
import org.mockito.*;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;


public class GameOfLifePinningTest 
{
	/*
	 * READ ME: You may need to write pinning tests for methods from multiple
	 * classes, if you decide to refactor methods from multiple classes.
	 * 
	 * In general, a pinning test doesn't necessarily have to be a unit test; it can
	 * be an end-to-end test that spans multiple classes that you slap on quickly
	 * for the purposes of refactoring. The end-to-end pinning test is gradually
	 * refined into more high quality unit tests. Sometimes this is necessary
	 * because writing unit tests itself requires refactoring to make the code more
	 * testable (e.g. dependency injection), and you need a temporary end-to-end
	 * pinning test to protect the code base meanwhile.
	 * 
	 * For this deliverable, there is no reason you cannot write unit tests for
	 * pinning tests as the dependency injection(s) has already been done for you.
	 * You are required to localize each pinning unit test within the tested class
	 * as we did for Deliverable 2 (meaning it should not exercise any code from
	 * external classes). You will have to use Mockito mock objects to achieve this.
	 * 
	 * Also, you may have to use behavior verification instead of state verification
	 * to test some methods because the state change happens within a mocked
	 * external object. Remember that you can use behavior verification only on
	 * mocked objects (technically, you can use Mockito.verify on real objects too
	 * using something called a Spy, but you wouldn't need to go to that length for
	 * this deliverable).
	 */

	/* TODO: Declare all variables required for the test fixture. */
	MainPanel main;
	@Mock
	Cell[][] cells;
	
	@Before
	public void setUp() 
	{
		/*
		 * TODO: initialize the text fixture. For the initial pattern, use the "blinker"
		 * pattern shown in:
		 * https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life#Examples_of_patterns
		 * The actual pattern GIF is at:
		 * https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life#/media/File:Game_of_life_blinker.gif
		 * Start from the vertical bar on a 5X5 matrix as shown in the GIF.
		 */

		main = new MainPanel(5);
		cells = new Cell[5][5];

		// initiliaze all cells to false
		for (int i = 0; i < 5; i++) 
		{
			for (int j = 0; j < 5; j++) 
			{
				cells[i][j] = Mockito.mock(Cell.class);

				if (i == 2) 
				{
					if(j == 1 || j == 2 || j == 3)
						Mockito.when(cells[i][j].getAlive()).thenReturn(true);
					else
						Mockito.when(cells[i][j].getAlive()).thenReturn(false);
				}
				else
					Mockito.when(cells[i][j].getAlive()).thenReturn(false);
			}
		}

		main.setCells(cells);
	}

	@After
	public void tearDown()
	{
		main = null;
		cells = null;
	}

	/* TODO: Write the three pinning unit tests for the three optimized methods */

	/**
	 * Test case for void calculateNextIteration()
	*/
	@Test
	public void testCalculateNextIteration()
	{

		main.calculateNextIteration();

		for (int i = 0; i < 5; i++) 
		{
			for (int j = 0; j < 5; j++) 
			{
				if (j == 2) 
				{
					if(i == 1 || i == 2 || i == 3)
					{	
						Mockito.verify(cells[i][j]).setAlive(true);
						break;
					}
					else
					{
						Mockito.verify(cells[i][j]).setAlive(false);
						break;
					}
				}
				else 
					Mockito.verify(cells[i][j]).setAlive(false);
			}
		}
	}

	/**
	 * Test case for boolean iterateCell(int x, int y)
	*/	
	@Test
	public void testIterateCell()
	{
		for (int i = 0; i < 5; i++)
		{
			for (int j = 0; j < 5; j++) 
			{
				if (j == 2) 
				{
					if(i == 1 || i == 2 || i == 3)
					{		
						assertTrue(main.iterateCell(i,j));
						break;
					}
					else
					{
						assertFalse(main.iterateCell(i,j));
						break;
					}
				}
				else 
					assertFalse(main.iterateCell(i,j));
			}
		}
	}

	/**
	 * Test case for String toString()
	*/
	@Test
	public void testToString()
	{
		Cell a = new Cell(true);
		Cell b = new Cell(false);

		assertEquals(a.toString(), "X");
		assertEquals(b.toString(), ".");
	}
}
