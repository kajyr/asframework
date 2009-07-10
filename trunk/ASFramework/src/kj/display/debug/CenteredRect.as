package kj.display.debug {
	
	import flash.display.Shape;
	import flash.geom.Point;
	
	import kj.utils.Random;
	
	public class CenteredRect extends Shape {
		public static var size:Number = 10;
		
		function CenteredRect(center:Point, halfWidth:Number, halfHeight:Number):void {
			var color:uint = Random.color();
			graphics.lineStyle(2, color);
			graphics.beginFill(color, 0.5);
			graphics.drawRect(center.x - halfWidth, center.y - halfHeight, 2*halfWidth, 2*halfHeight);
			graphics.endFill();
		}
	}
}