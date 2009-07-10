package kj.display.ui  {
	import flash.display.Sprite;
	import kj.utils.Random;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	import flash.media.Sound;
    import flash.media.SoundChannel;
    import flash.net.URLRequest;
	/**
		Classe base per ogni bottone
	*/
	public class TestButton extends Sprite {
		
		/**
			Costruttore
		*/
		public function TestButton(w:Number = 150, h:Number = 50):void {
			super();
			graphics.beginFill(Random.color());
			graphics.drawRect(0, 0, w, h);
			graphics.endFill();
			filters = new Array( new DropShadowFilter(2));
			buttonMode = true;
			// sound
         /*   sound = new Sound();
			sound.load(new URLRequest(""));*/
			// handlers
			addEventListener(MouseEvent.MOUSE_DOWN, onMDown);
			addEventListener(MouseEvent.MOUSE_UP, onMUp);
			addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onMDown(event:MouseEvent):void {
			filters = new Array( new DropShadowFilter(2, 45, 0, 1, 4, 4, 1, 1, true));
		}
		private function onMUp(event:MouseEvent):void {
			filters = new Array( new DropShadowFilter(2));
		}
		private function onClick(event:MouseEvent):void {
			
		}
	}
}