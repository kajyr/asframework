package kj.utils
{
    public class Random
    {
        /**
         * Defines the message String which is used as the property of the Exception
         */
        private static const MESSAGE:String = "Illegal instantiation attempted.";

        public function Random()
        {
            throw new Error(MESSAGE);
        }
		
		public static function randSign():int {
			var n:Number = Math.round(Math.random())
			if (n == 0) return -1
			return n;
		}
		
		public static function randInt(n:Number = 1):uint {
			return Math.round(Math.random() * n);
		}
		
		public static function randNumber(n:Number = 1):int {
			return Math.random() * n;
		}
    }
}

