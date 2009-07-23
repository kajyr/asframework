package kj.utils
{
	public class Chance extends StaticClass
	{
		public function Chance()
		{
			super();
		}
		
		public static function run(chance:Number, f:Function, args:Array = null):void {
			if (Random.randNumber() <= chance) f();
		}
		
	}
}