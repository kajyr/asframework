package kj.display {
	import flash.geom.Rectangle;

	public interface IDraggable  {
		function enableDrag(bounds:Rectangle = null):void;
		function disableDrag():void;
	}
}