package kj.utils
{
    public class Range extends Array
    {
		public static function numeric(min:Number = 0, max:Number = 100, step:Number = 1):Range {
			var r:Range = new Range();
			for (var i:Number = min; i <= max; i += step) {
				r.push(i);
			}
			return r;
		}
		
		public static function simple(length:uint):Range {
			return Range.numeric(0, length - 1);
		}
    }
}

