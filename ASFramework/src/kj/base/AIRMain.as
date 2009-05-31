package kj.base
{
	import flash.display.NativeWindow;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	import flash.geom.Rectangle;
	
	/**
	 * E se la integrassi in Main? Che succederebbe? I vecchi swf che ho fatto funzionerebbero ancora? 
	 * @author kajyr
	 * 
	 */
	public class AIRMain extends Sprite
	{
		public static var window:NativeWindow;
		public static var istance:Sprite;
				
		public function AIRMain(scaleMode:String = StageScaleMode.EXACT_FIT):void {
			istance = this;
			window = stage.nativeWindow;
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = scaleMode;
		}
		/**
		
		Se imposto hwRect allora flash / air andrà in accellerazione hardware alla risoluzione impostata
		ex
		goFullScreen(new Rectangle(0,0,1024,768));
		
		*/
		public function set fullScreen(value:Boolean):void {
			if (value) {
				stage.fullScreenSourceRect = new Rectangle(0, 0, stage.stageWidth, stage.stageHeight);
				stage.displayState = StageDisplayState.FULL_SCREEN;
			} else {
				stage.displayState = StageDisplayState.NORMAL;
			}
		}
	}
}