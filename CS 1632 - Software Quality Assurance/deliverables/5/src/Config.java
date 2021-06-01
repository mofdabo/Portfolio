public class Config {
	// Whether to intentionally inject bugs into BeanCounterLogic.
	private static boolean buggyBeanCounterLogic = false;
	
	public static void setBuggyBeanCounterLogic(boolean val) {
		buggyBeanCounterLogic = val;
	}

	public static boolean getBuggyBeanCounterLogic() {
		return buggyBeanCounterLogic;
	}
}
