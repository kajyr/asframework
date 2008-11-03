package ui {
	import fl.video.FLVPlayback;
	import fl.video.VideoEvent;
	
	/**
		Classe per aggiungere proprietà a FLVPlayback
	*/
	public class FLVPlayer extends FLVPlayback {
		private var _loop:Boolean;
		/**
			Costruttore
		*/
		public function FLVPlayer(source:String = null):void {
			super();
			this.source = source;
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
	}
}