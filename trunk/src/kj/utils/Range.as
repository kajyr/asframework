package kj.utils
{
	import kj.utils.StaticClass;
    public class Range extends StaticClass
    {
		public static function numeric(min:Number = 0, max:Number = 100, step:Number = 1):Array {
			var r:Array = new Array();
			for (var i:Number = min; i <= max; i += step) {
				r.push(i);
			}
			return r;
		}
    }
}

