package 
{
	import flash.media.Video;
	import org.openvideoplayer.net.*;
	import org.openvideoplayer.events.*;
	import com.carlcalderon.arthropod.Debug;
	
	/**
	 * Video Player based on  the openvideoplayer project rather  than FLVPlaybeck.
	 * Much lighter.
	 * @author Carlo
	 */
	public class OVPlayer extends Video { 
	{	
		private var player:Video;
		private var stream:OvpNetStream;
		private var length:Number = -1;
		private var needReload:Boolean = true;
		
		public var path:String;
		public var autoPlay:Boolean = false;
		public var loop:Boolean = false;
		
		public function OVPlayer (path:String):void {
			super();
			this.path = path;
			
			var conn:OvpConnection = new OvpConnection()
			conn.addEventListener(OvpEvent.ERROR, errorHandler);
			conn.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler);
			conn.connect(null);
			
			addEventListener(Event.ADDED_TO_STAGE, onAttach);
			addEventListener(Event.REMOVED_FROM_STAGE, onDetach);
		}
		
		public function play():void {
			if (needReload) {
				stream.play(path);
				needReload = false;
			}
			stream.resume();
		}
		public function pause():void {
			stream.pause();
		}
		public function stop():void {
			stream.dispatchEvent(new OvpEvent(OvpEvent.COMPLETE));
		}
		
		protected function onAttach(e:Event):void {
			if (autoPlay) stream.resume();
		}
		protected  function onDetach(e:Event):void {
			stream.close();
			stream.removeEventListener(OvpEvent.PROGRESS, progressHandler);
			if (seekBarOver && seekBarOver.parent) seekBarOver.parent.removeChild(seekBarOver);
		}
		
		// Handles all OvpEvent.ERROR events
		private function errorHandler(e:OvpEvent):void {
			Debug.error("Error #" + e.data.errorNumber + ": " + e.data.errorDescription);
		}
		
		// Handles NetStatusEvent.NET_STATUS events fired by the OvpConnection class
		private function netStatusHandler(e:NetStatusEvent):void {
			switch (e.info.code) {
				case "NetConnection.Connect.Rejected":
					Debug.error("Rejected by server. Reason is " + e.info.description);
					break;
				case "NetConnection.Connect.Success":
					connectedHandler(e.target as OvpConnection);
					break;
			}
		}
		
		private function connectedHandler(conn:OvpConnection):void {
			stream = new OvpNetStream(conn);
			stream.addEventListener(OvpEvent.STREAM_LENGTH, streamLengthHandler);
			stream.addEventListener(OvpEvent.COMPLETE, completeHandler);
			attachNetStream(stream);
			stream.play(path);
			needReload = false;
			stream.pause();
		}
		
		private function completeHandler(e:OvpEvent):void {
			if (loop) {
				stream.seek(0);
			} else {
				stream.close();
				needReload = true;
			}
		}
		
		private function streamLengthHandler(e:OvpEvent):void {
			Debug.log("Stream length is " + e.data.streamLength);
			length = e.data.streamLength;
			stream.addEventListener(OvpEvent.PROGRESS, progressHandler);
		}
	}
	
}