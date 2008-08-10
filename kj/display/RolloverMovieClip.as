package kj.display {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	public class RolloverMovieClip extends DetachableMovieClip {
		
		public function RolloverMovieClip():void
		{
			stop();
			this.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			this.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
		}
		
		
		public function onMouseOver(event:MouseEvent):void {
			this.gotoAndStop("mouseover");
		}
		public function onMouseOut(event:MouseEvent):void {
			this.gotoAndStop("mouseout");
		}
	}
}