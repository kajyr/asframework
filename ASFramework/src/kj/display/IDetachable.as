package kj.display {
	import flash.display.DisplayObjectContainer;
	
	public interface IDetachable
	{
		function get attached() : Boolean;
		function detach() : void;
	}
	
}