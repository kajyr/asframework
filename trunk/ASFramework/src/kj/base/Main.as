package kj.base{
	import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	import flash.geom.Rectangle;
	
	import kj.utils.AIR;

	//import kj.utils.AIR;

	public class Main extends MovieClip {

		public static  var istance:Main;

		public function Main(scaleMode:String = StageScaleMode.EXACT_FIT):void {
			istance = this;
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = scaleMode;
		}
		/**
		
		Se imposto hwRect allora flash / air andrà in accellerazione hardware alla risoluzione impostata
		ex
		goFullScreen(new Rectangle(0,0,1024,768));
		
		*/
		public function goFullScreen(hwRect:Rectangle = null):void {

			if (hwRect && AIR.enabled) {
				stage["fullScreenSourceRect"] = hwRect;
			}
			stage.displayState = StageDisplayState.FULL_SCREEN;
		}
		
		public function goNormalSize():void {
			stage.displayState = StageDisplayState.NORMAL;
		}
	}
}
