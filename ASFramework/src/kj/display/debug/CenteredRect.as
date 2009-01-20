package kj.display.debug {
	
	import flash.display.Shape;
	import kj.utils.Random;
	import flash.geom.Point;
	
	public class CenteredRect extends Shape {
		public static var size:Number = 10;
		
		function CenteredRect(center:Point, hw, hh):void {
			var color:uint = Random.randColor();
			graphics.lineStyle(2, color);
			graphics.beginFill(color, 0.5);
			graphics.drawRect(center.x - hw, center.y - hh, 2*hw, 2*hh);
			graphics.endFill();
		}
	}
}