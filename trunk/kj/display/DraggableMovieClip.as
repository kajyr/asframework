package kj.display {
	import flash.events.MouseEvent;
	import flash.events.Event;

	public class DraggableMovieClip extends DetachableMovieClip implements IDraggable {

		/*protected var container:MovieClip;
		protected var attached:Boolean = false;*/
		protected var draggable:Boolean = false;
		public static const STOP_DRAG:String = "stopdrag";
		public static const START_DRAG:String = "startdrag";

		public function enableDrag():void {
			if (!draggable) {
				this.addEventListener(MouseEvent.MOUSE_DOWN, downHandler);
				this.addEventListener(MouseEvent.MOUSE_UP, upHandler);
				draggable = true;
			}
		}
		
		public function disableDrag():void {
			if (draggable) {
				this.removeEventListener(MouseEvent.MOUSE_DOWN, downHandler);
				this.removeEventListener(MouseEvent.MOUSE_UP, upHandler);
				draggable = false;
			}
		}
		
		private function downHandler(event:MouseEvent):void {
			this.startDrag(false);
			dispatchEvent(new Event(START_DRAG));
		}
		private function upHandler(event:MouseEvent):void {
			this.stopDrag();
			//trace(this + " moved to (" + x + ", " + y + ")");
			dispatchEvent(new Event(STOP_DRAG));
		}
		
	}
}