package {

	import kj.graphs.Cell;
	import kj.display.DraggableSprite;
	import flash.display.Shape;


	public class TestCell extends Cell {
		
		public static var COUNTER:uint = 0;
		
		public function TestCell(c:uint = 0x339900):void {
			super(COUNTER++);
			color = c;
			display.graphics.lineStyle(1, 0x000000);
			display.graphics.beginFill(color);
			display.graphics.drawCircle(0, 0, 10);
			display.graphics.endFill();
			display.enableDrag();
		}

		protected override function link(c:Cell):void {
			if (archi[c]) {
				//throw new Error("Arco (" + this + ", " + c + ") gia esistente");
				unlink(c);
			}
			var arco:Shape = new Shape();
			arco.graphics.lineStyle(0, 0x000000);
			arco.graphics.lineTo(c.display.x - display.x, c.display.y - display.y);
			arco.graphics.lineStyle(0, 0xFF0000);
			archi[c] = display.addChildAt(arco, 0);
		}
		protected override function unlink(c:Cell):void {
			if (archi[c]) {
				archi[c].parent.removeChild(archi[c]);
				archi[c] = null;
			}
		}
	}
}