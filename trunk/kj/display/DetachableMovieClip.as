﻿package kj.display {
	import flash.display.MovieClip;
	import flash.display.DisplayObjectContainer;

	public class DetachableMovieClip extends MovieClip implements IDetachable {

		public function get container():DisplayObjectContainer {
			if (attached) return parent;
			else return null;
		}
		
		public function attach(c:DisplayObjectContainer):void
		{
			if (c && !attached) {
				c.addChild(this);
			}
		}
		public function attachAt(c:DisplayObjectContainer, i:int):void
		{
			if (c && !attached) {
				c.addChildAt(this, i);
			}
		}
		public function detach():void {
			if (attached) {
				parent.removeChild(this);
			}
		}
		
		public function get attached():Boolean { 
            return (this.parent != null); 
        } 
		
		public function move(xx:Number, yy:Number) {
			x = xx;
			y = yy;
		}
	}
}