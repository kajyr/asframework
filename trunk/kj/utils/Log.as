package kj.utils {
	
	import flash.text.TextField;
	import flash.external.ExternalInterface;
	
	/**
	
		Inserire un modo per loggare su file
	
	*/
	public class Log {
		
		private static var _stdout:TextField;
		public static var timestamp:Boolean = false;
		public static var cSharpLog:Boolean = false;
		public static var cSharpLogFunction:String;
		
		
		public static function log(id:String, message:String):void {
			message = "[" + id + "] " + message;
			if (timestamp) {
				var d:Date = new Date();
				message = d.toLocaleString() + " - " + message;
			}
			if (STDOUT) {
				STDOUT.appendText(message + "\n");
			} else {
				trace(message);
			}
			if (cSharpLog && cSharpLogFunction) {
				 ExternalInterface.call(cSharpLogFunction, message);
			}
		}
		
		public static function set STDOUT(out:TextField):void {
			_stdout = out;
		}
		public static function get STDOUT():TextField {
			return _stdout;
		}
	}
}