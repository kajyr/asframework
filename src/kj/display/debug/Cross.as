package kj.display.debug {
	
	import flash.display.Shape;
	import kj.utils.Random;
	
	public class Cross extends Shape {
		public static var size:Number = 10;
		
		function Cross(x, y):void {
			graphics.lineStyle(2, Random.randColor());
			graphics.moveTo(x, y - size);
			graphics.lineTo(x, y + size);
			graphics.moveTo(x - size, y);
			graphics.lineTo(x + size, y);
		}
	}
}