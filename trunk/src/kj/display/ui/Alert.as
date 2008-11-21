package kj.display.ui {
	
	import kj.display.DetachableSprite;
	import kj.utils.StaticClass;
	
	import flash.display.Stage;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize
	
	import flash.events.MouseEvent;
	
	public class Alert extends StaticClass {
		
		private static var currentAlert:DetachableSprite;
		private static var actualStage:Stage;
		
		public function FullStageAlert():void {
			super();
		}
		
		public static function register(stage:Stage):void {
			actualStage = stage;
		}
		
		public static function alert(message:String):void {
			if (!actualStage) {
				throw new Error("actual stage not registered. use register()");
			}
			currentAlert = new DetachableSprite();
			currentAlert.graphics.beginFill(0x000000, 0.7);
			currentAlert.graphics.drawRect(0, 0, actualStage.stageWidth, actualStage.stageHeight);
			currentAlert.graphics.endFill();
			var label:TextField = getLabel(message)
			label.x = actualStage.stageWidth /2 - label.width /2;
			label.y = actualStage.stageHeight /2 - label.height /2;
			currentAlert.addChild(label);
			currentAlert.buttonMode = true;
			currentAlert.addEventListener(MouseEvent.CLICK, onCAclick);
			currentAlert.attach(actualStage);
		}
		
		private static function getLabel(text:String, color:uint = 0xAAAAAA):TextField {
			var label:TextField = new TextField();
			label.defaultTextFormat = new TextFormat("Verdana", 16, color);
			label.autoSize = TextFieldAutoSize.LEFT;
			label.selectable = false;
			label.text = text;
			return label;
		}
		
		private static function onCAclick(event:MouseEvent):void {
			if (currentAlert && currentAlert.parent) {
				currentAlert.parent.removeChild(currentAlert);
				currentAlert == null;
			}
		}
	}
}