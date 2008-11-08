package kj.utils {
	import flash.desktop.NativeApplication;
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
				var app:NativeApplication = NativeApplication.nativeApplication;
				return true;
			} catch (err:Error) {
				return false;
			}
		}
	}
}