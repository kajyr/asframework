package kj.display.debug
{
	import flash.display.Shape;
	import flash.geom.Rectangle;
	
	import kj.utils.Random;

	public class DRectangle extends Shape
	{
		public function DRectangle(rectangle:Rectangle, color:uint = 0x123456)
		{
			super();
			if (color == 0x123456) color = Random.randColor();
			graphics.lineStyle(2, color);
			graphics.beginFill(color, 0.3);
			graphics.drawRect(rectangle.x, rectangle.y,rectangle.width,rectangle.height);
			graphics.endFill();
		}
		
	}
}