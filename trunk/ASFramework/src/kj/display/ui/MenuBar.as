package kj.display.ui
{
	import com.carlcalderon.arthropod.Debug;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.NativeWindowBoundsEvent;
	
	import gs.TweenLite;
	
	import kj.base.AIRMain;
	import kj.display.kjSprite;

	public class MenuBar extends kjSprite implements IToolBar
	{
		public var menu:Sprite;
		public function MenuBar()
		{
			super();
			menu = new Sprite();
			paint();
			menu.y = - menu.height;
			addChild(menu);	
			addEventListener(MouseEvent.ROLL_OVER, showMenu);
			addEventListener(MouseEvent.ROLL_OUT, hideMenu);
			AIRMain.istance.stage.addEventListener(Event.RESIZE, onResize);
		}
		
		private function onResize(event:Event):void {
			paint();
		}
		
		private function paint():void {
			graphics.clear();
			graphics.beginFill(0xffffff, 0);
			graphics.drawRect(0, 0, AIRMain.istance.stage.stageWidth, 50);
			graphics.endFill();
			
			menu.graphics.clear();
			menu.graphics.beginFill(0, 0.5);
			menu.graphics.drawRect(0, 0, AIRMain.istance.stage.stageWidth, 50);
			menu.graphics.endFill();
		}
		
		private function showMenu(e:MouseEvent):void {
			TweenLite.to(menu, 0.5, {y:0});
		}
		private function hideMenu(e:MouseEvent):void {
			TweenLite.to(menu, 0.5, {y:-menu.height, delay:0.5});
		}
		public function addButton(child:DisplayObject):DisplayObject {
			return menu.addChild(child);
		}
	}
}