package {
	
	import kj.base.Main;
	import kj.display.utils.SortOnScreen;
	import flash.geom.Rectangle;
	
	public class TestNetwork extends Main {
		public function TestNetwork():void {
			super();
			var c0:TestCell = new TestCell(0x00AA00);
			var c1:TestCell = new TestCell(0x00AA00);
			var c2:TestCell = new TestCell(0x00AA00);
			var c3:TestCell = new TestCell(0x00AA00);
			var c4:TestCell = new TestCell(0x00AA00);
			
			c0.display.x = stage.stageWidth /2;
			c0.display.y = stage.stageHeight /5;
			
			var pad:Number = 50;
			SortOnScreen.star(new Array(c0.display, c1.display, c2.display, c3.display, c4.display), new Rectangle(pad, pad, stage.stageWidth - 2*pad, stage.stageHeight - 2*pad));
			
			c0.vicini.enqueue(c1);
			c0.vicini.enqueue(c2);
			c0.vicini.enqueue(c3);
			c0.vicini.enqueue(c4);
			c1.vicini.enqueue(c2);
			c1.vicini.enqueue(c3);
			c2.vicini.enqueue(c4);
			c3.vicini.enqueue(c1);
			c3.vicini.enqueue(c4);
			
			addChild(c0.display);
			addChild(c1.display);
			addChild(c2.display);
			addChild(c3.display);
			addChild(c4.display);
		}
	}
}