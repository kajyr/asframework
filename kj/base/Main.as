package kj.base {
	import flash.display.MovieClip;
	
	public class Main extends MovieClip {
		
		public static var istance:Main;
		
		public function Main():void {
			istance = this;
		}
	}
}