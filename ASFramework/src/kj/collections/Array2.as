package kj.collections
{	
	import kj.collections.ICollection;
	
	import com.carlcalderon.arthropod.Debug;
		//bubu
	public class Array2 extends Array implements ICollection
	{
		private var _width:uint;
		private var _height:uint;
		
		public function Array2(width:uint, height:uint):void
		{
			super(width);
			_width = width;
			_height = height;
			for (var i:uint = 0; i < width; i++) {
				this[i] = new Array(height);
			}
		}
		
		public function get width():uint { return _width; }
		public function get height():uint { return _height; }
		public function contains(obj:*):Boolean {
			for (var i:uint = 0; i < width; i++) {
				for (var i:uint = 0; i < width; i++) {
					if (this[i][j] === obj) {
						return true;
					}
				}
			}
			return false;
		}
        public function clear():void {
			for (var i:uint = 0; i < width; i++) {
				for (var i:uint = 0; i < width; i++) {
					this[i][j] = undefined;
				}
			}
		}
		public function get Iterator():IIterator {}
		public override function get length():uint {return _width * _height;}
		public function isEmpty():Boolean {
			var empty:Boolean = true;
			for (var i:uint = 0; i < width; i++) {
				for (var i:uint = 0; i < width; i++) {
					empty &= this[i][j] == undefined;
				}
			}
			return empty;
		}
		public function toArray():Array {
			var a:Array = new Array();
			for (var i:uint = 0; i < width; i++) {
				//a.append(this[i]);
			}
			return a;
		}
	}
}