package kj.display {
	import flash.display.DisplayObjectContainer;
	
	public interface IDetachable
	{
		function get attached() : Boolean
		function attach(p:DisplayObjectContainer) : void
		function attachAt(p:DisplayObjectContainer, index:int) : void
		function detach() : void
	}
	
}