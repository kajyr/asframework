package kj.display.utils {
	
	import kj.utils.StaticClass
	import flash.geom.Point;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;

	public class SortOnScreen extends StaticClass {
		
		/*
		
		Malemalemale dovrei usare LinkedList
		
		*/
		public static function circle(items:Array, center:Point, distance:Number = -1, initialAngle:Number = 0):void {
			var step:Number = (2* Math.PI) / items.length;
			if (distance < 0) distance = 20 * items.length; // teorema di pitagora..
			
			var angle:Number = initialAngle;

			for each (var d:DisplayObject in items) {
				//var distance:Number = d.height / Math.sin(angle);
				d.x = center.x + distance * Math.cos(angle);
				d.y = center.y + distance * Math.sin(angle);
				angle += step;
			}
		}
		
		public static function orizontalLine(items:Array, start:Point, length:Number = -1):void {
			var pos = start;
			for each (var d:DisplayObject in items) {
				d.x = pos.x;
				d.y = pos.y;
				
				if (length > 0) {
					pos.x += length / items.length;
				} else {
					pos.x += d.width;
				}
			}
		}
		public static function verticallLine(items:Array, start:Point, length:Number = -1):void {
			var pos = start;
			for each (var d:DisplayObject in items) {
				d.x = pos.x;
				d.y = pos.y;
				
				if (length > 0) {
					pos.y += length / items.length;
				} else {
					pos.y += d.height;
				}
			}
		}
		public static function center(item:DisplayObject, base:DisplayObjectContainer):void {
			if (base.contains(item)) {
				item.x = base.width /2 - item.width /2;
				item.y = base.height /2 - item.height /2;
			} else {
				item.x = base.x + base.width /2 - item.width /2;
				item.y = base.y + base.height /2 - item.height /2;
			}
		}
	}
}