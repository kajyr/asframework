package kj.display.ui {
	import fl.video.FLVPlayback;
	import fl.video.VideoEvent;
	import fl.video.VideoScaleMode;
	import flash.events.Event;
	
	/**
		Classe per aggiungere proprietà a FLVPlayback
		Note that to actually use this class you have to import the FLVPlayback component into the library
	*/
	public class FLVPlayer extends FLVPlayback {
		private var _loop:Boolean;
		/**
			Costruttore
		*/
		public function FLVPlayer(source:String = null):void {
			super();
			
			scaleMode = VideoScaleMode.NO_SCALE;
			fullScreenTakeOver = false; //stupid stupid property;
			autoPlay = false; // i do autoPlay on attach! Much better
			//scaleMode = VideoScaleMode.NO_SCALE; // of course we don't want scaling! Who does?
			this.source = source;
			addEventListener(Event.ADDED_TO_STAGE, onAttach);
			addEventListener(Event.REMOVED_FROM_STAGE, onDetach);
		}
		
		/**
			Loop the video (once it is finished, restarts.)
		*/
		public function get doLoop():Boolean {
			return _loop;
		}
		public function set doLoop(value:Boolean):void {
			_loop = value;
			if (value) {
				autoRewind = true;
				addEventListener(VideoEvent.COMPLETE, loop);
			} else {
				removeEventListener(VideoEvent.COMPLETE, loop);
			}
		}
		/**
			Fa ripartire il loop.
			Non è possibile inserirla come lambda function perchè è necessario averne un ref per poi rimuoverle
		*/
		private function loop(e:VideoEvent) {
			play();
		}
		
		/**
			Auto plays the video on Attach (not before)
		*/
		private function onAttach(e:Event):void {
			play();
		}
		/**
			Auto stop the video on Detach (oh god i'm so smart)
		*/
		private function onDetach(e:Event):void {
			stop();
		}
	}
}