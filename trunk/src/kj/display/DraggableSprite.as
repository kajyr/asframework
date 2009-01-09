package kj.display {
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;

	public class DraggableSprite extends DetachableSprite implements IDraggable {

		/*protected var container:MovieClip;*/
		protected var dragging:Boolean = false;
		protected var draggable:Boolean = false;
		public static const START_DRAG:String = "start_drag";
		public static const STOP_DRAG:String = "stop_drag";
		public static const SLIPPED_DRAG:String = "slipped_drag";
		private var bounds:Rectangle = null;

		public function enableDrag(bounds:Rectangle = null):void {
			if (!draggable) {
				this.bounds = bounds;
				addEventListener(MouseEvent.MOUSE_DOWN, downHandler);
				addEventListener(MouseEvent.MOUSE_UP, upHandler);
				addEventListener(MouseEvent.MOUSE_OUT, outHandler);
				draggable = true;
			}
		}
		
		public function disableDrag():void {
			if (draggable) {
				stopDrag();
				removeEventListener(MouseEvent.MOUSE_DOWN, downHandler);
				removeEventListener(MouseEvent.MOUSE_UP, upHandler);
				draggable = false;
			}
		}
		
		private function downHandler(event:MouseEvent):void {
			startDrag(false, bounds);
			dragging = true;
			dispatchEvent(new Event(START_DRAG));
		}
		private function upHandler(event:MouseEvent):void {
			stopDrag();
			dragging = false;
			//trace(this + " moved to (" + x + ", " + y + ")");
			dispatchEvent(new Event(STOP_DRAG));
		}
		private function outHandler(event:MouseEvent):void {
			if (dragging) {
				//stopDrag();
				dispatchEvent(new Event(SLIPPED_DRAG));
			}
		}
		
	}
}