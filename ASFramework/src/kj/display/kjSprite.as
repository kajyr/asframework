package kj.display {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;

	public class kjSprite extends Sprite implements IDetachable, IDraggable {

		protected var dragging:Boolean = false;
		protected var draggable:Boolean = false;
		public static const START_DRAG:String = "start_drag";
		public static const STOP_DRAG:String = "stop_drag";
		public static const SLIPPED_DRAG:String = "slipped_drag";
		private var bounds:Rectangle = null;
		
		public function detach():void {
			if (parent && attached) {
				parent.removeChild(this);
			}
		}
		
		public function get attached():Boolean { 
            return (this.parent != null); 
        }
        
        public function position(x:Number, y:Number):void {
        	this.x = x;
        	this.y = y;
        }
        
        /**
         *
         * @todo upHandler dovrebbe essere attacato al padre o allo stage, però poi c'è il problema dei refernce. Usare weak? 
         * @param bounds
         * 
         */
        public function enableDrag(bounds:Rectangle = null):void {
			if (!draggable) {
				this.bounds = bounds;
				addEventListener(MouseEvent.MOUSE_DOWN, downHandler);
				addEventListener(MouseEvent.MOUSE_UP, upHandler);
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
			dispatchEvent(new Event(STOP_DRAG));
		}
	}
}