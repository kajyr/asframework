package kj.audio {
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import flash.events.IOErrorEvent;	
	import kj.display.ui.Alert;
	import flash.events.Event;
	
	public class SimplePlayer {
		
		private static var sound:Sound;
		private static var channel:SoundChannel;
		
		public function SimplePlayer() {}
		
		public static function play(path:String, time:Number = 0):void {
			stop();
			sound = new Sound();
			sound.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
			sound.load(new URLRequest(path));
			channel = sound.play(time);
			channel.addEventListener(Event.SOUND_COMPLETE, function (e:Event):void { channel = sound.play(time) });
		}
		
		public static function stop():void {
			if (sound) sound.close();
		}
		public static function errorHandler(event:IOErrorEvent):void {
			Alert.alert(event.text);
        }
		
		public static function seek():void {
			
		}
	}
}