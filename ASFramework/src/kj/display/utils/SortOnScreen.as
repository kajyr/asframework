package kj.display.utils {
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import kj.graphs.Graph;
	import kj.utils.StaticClass;

	public class SortOnScreen extends StaticClass {
		
		public static function circle(items:Array, center:Point, distance:Number = -1, initialAngle:Number = 0, orientation:Number = 1):void {
			var step:Number = ((2* Math.PI) / items.length) * (orientation / Math.abs(orientation)); // orientation è il verso
			var angle:Number = initialAngle;
			for each (var d:DisplayObject in items) {
				if (distance < 0) distance = d.height+10 / Math.sin(step);
				d.x = center.x + distance * Math.cos(angle);
				d.y = center.y + distance * Math.sin(angle);
				angle += step;
			}
		}
		
		public static function circularGraph(items:Graph, center:Point):void {
			//serve una bfs per avere i nodi nell'ordine giusto
		}
		
		public static function orizontalLine(items:Array, start:Point, length:Number = -1):void {
			var pos:Point = start;
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
			var pos:Point = start;
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
		public static function star(items:Array, area:Rectangle):void {
			if (items.length != 5) {
				throw new Error("For a star you need just 5 items");
			}
			items[0].x = area.x + area.width /2;
			items[0].y = area.top;
			items[1].x = area.left;
			items[1].y = area.y + area.height * 2/5;
			items[2].x = area.right;
			items[2].y = area.y + area.height * 2/5;
			items[3].x = area.x + area.width * 1/5;
			items[3].y = area.bottom;
			items[4].x = area.x + area.width * 4/5;
			items[4].y = area.bottom;
		}
	}
}