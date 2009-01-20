package kj.display.debug
{
	import flash.display.Shape;
	import flash.geom.Rectangle;
	
	import kj.utils.Random;

	public class DRectangle extends Shape
	{
		public function DRectangle(rectangle:Rectangle)
		{
			super();
			var color:uint = Random.randColor();
			graphics.lineStyle(2, color);
			graphics.beginFill(color, 0.2);
			graphics.drawRect(rectangle.x, rectangle.y,rectangle.width,rectangle.height);
			graphics.endFill();
		}
		
	}
}