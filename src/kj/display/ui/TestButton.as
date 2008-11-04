package kj.display.ui  {
	import flash.display.Sprite;
	import kj.utils.Random;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	/**
		Classe base per ogni bottone
	*/
	public class TestButton extends Sprite {
		
		/**
			Costruttore
		*/
		public function TestButton():void {
			super();
			graphics.beginFill(Random.randColor());
			graphics.drawRect(0, 0, 150, 50);
			graphics.endFill();
			filters = new Array( new DropShadowFilter(2));
			buttonMode = true;
			addEventListener(MouseEvent.MOUSE_DOWN, onMDown);
			addEventListener(MouseEvent.MOUSE_UP, onMUp);
		}
		
		private function onMDown(event:MouseEvent):void {
			filters = new Array( new DropShadowFilter(2, 45, 0, 1, 4, 4, 1, 1, true));
		}
		private function onMUp(event:MouseEvent):void {
			filters = new Array( new DropShadowFilter(2));
		}
	}
}