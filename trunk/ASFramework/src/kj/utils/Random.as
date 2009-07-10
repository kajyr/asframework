package kj.utils
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
    public class Random extends StaticClass
    {
		public static function randSign():Number {
			var n:Number = Math.round(Math.random())
			if (n == 0) return -1
			return n;
		}
		
		public static function int(min:Number = 0, max:Number = 1):uint {
			return Math.round(Math.random() * (max - min) + min);
		}
		
		public static function randNumber(n:Number = 1):Number {
			return Math.random() * n;
		}
		
		/**
			Returns a random color
		*/
		public static function color():uint {
			return Math.random() * 0xFFFFFF;
		}
		
		public static function bool():Boolean {
			return (Math.round(Math.random()) == 0);
		}
		
		public static function point(area:Rectangle):Point {
			return new Point(Random.int(area.x, area.x + area.width), Random.int(area.y, area.y + area.height));
		}
    }
}

