package kj.display.ui  {
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	import flash.text.TextFormat;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.text.AntiAliasType;
	/**
		Classe base per ogni bottone
	*/
	public class SimpleClose extends Sprite {
		
		/**
			Costruttore
		*/
		public function SimpleClose():void {
			super();
			var format:TextFormat = new TextFormat();
			format.font = "Verdana";
			format.color = 0xAAAAAA;
			format.size = 12;
			format.bold = true;
			format.align = TextFormatAlign.LEFT;
			
			var label:TextField = new TextField;
			label.defaultTextFormat = format;
			label.autoSize = TextFieldAutoSize.LEFT;
			label.antiAliasType = AntiAliasType.ADVANCED;
			label.selectable = false;
			mouseEnabled = false;
			label.text = "x";
			addChild(label);
			
			
			
			//graphics.beginFill(0, 0);
			graphics.lineStyle(1, 0xAAAAAA);
			graphics.drawRect(0, 0, 15, 15);
			//graphics.endFill();
			label.x = width /2 - label.width /2;
			label.y = height /2 - label.height /2 - 2;
			
			buttonMode = true;
			// handlers
			addEventListener(MouseEvent.MOUSE_DOWN, onMDown);
			addEventListener(MouseEvent.MOUSE_UP, onMUp);
			addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onMDown(event:MouseEvent):void {
			
		}
		private function onMUp(event:MouseEvent):void {
		}
		private function onClick(event:MouseEvent):void {
			
		}
	}
}