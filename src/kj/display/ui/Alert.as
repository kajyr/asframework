﻿package kj.display.ui {
	
	import kj.display.DetachableSprite;
	import kj.utils.StaticClass;
	import kj.base.Main;
	
	import flash.display.Stage;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	public class Alert extends StaticClass {
		
		private static var currentAlert:DetachableSprite;
		private static var actualStage:Stage;
		
		public function Alert():void {
			super();
		}
		
		public static function register(stage:Stage):void {
			actualStage = stage;
		}
		
		public static function alert(message:String, secondi:Number = -1):void {
			if (!actualStage) {
				if (Main.istance) actualStage = Main.istance.stage;
				else throw new Error("actual stage not registered. use register()");
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
			if (secondi > 0) {
				var t:Timer = new Timer(secondi * 1000, 1);
				t.addEventListener(TimerEvent.TIMER, onCAclick);
				t.start();
			}
			
		}
		
		private static function getLabel(text:String, color:uint = 0xAAAAAA):TextField {
			var label:TextField = new TextField();
			label.defaultTextFormat = new TextFormat("Verdana", 16, color);
			label.autoSize = TextFieldAutoSize.LEFT;
			label.selectable = false;
			label.text = text;
			label.mouseEnabled = false;
			return label;
		}
		
		private static function onCAclick(event:Event):void {
			if (currentAlert && currentAlert.parent) {
				currentAlert.parent.removeChild(currentAlert);
				currentAlert == null;
			}
		}
	}
}