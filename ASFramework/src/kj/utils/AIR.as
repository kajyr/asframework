package kj.utils {
	import kj.base.Main;
	
	//import flash.desktop.NativeApplication;
	/**
	     * Used to check basic stuff abount Adobe AIR
	     * @author kajyr
	     * 
	     */
	public class AIR extends StaticClass {
		/**
		 * Checks if AIR is active (if you can have access to the AIR libraries)
		 * 
		 */
		public static function get enabled():Boolean {
			try {
				var tmp:Object = Main.istance.stage["fullScreenSourceRect"];
			} catch (e:Error) {
				return false;
			}
			return true;
		}
	}
}