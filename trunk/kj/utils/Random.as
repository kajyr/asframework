package kj.utils
{
	import kj.utils.StaticClass;
    public class Random extends StaticClass
    {
		public static function randSign():int {
			var n:Number = Math.round(Math.random())
			if (n == 0) return -1
			return n;
		}
		
		public static function randInt(min:Number = 0, max:Number = 1):uint {
			return Math.round(Math.random() * (max - min) + min);
		}
		
		public static function randNumber(n:Number = 1):int {
			return Math.random() * n;
		}
    }
}

