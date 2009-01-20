package kj.display.ui {
	import flash.display.Sprite;
	import kj.display.DraggableSprite;
	import kj.base.Main;
	import kj.display.utils.Align;
	import flash.display.DisplayObject;
	import com.carlcalderon.arthropod.Debug;
	
	public class Toolbar extends DraggableSprite {
		public static const PADDING:Number = 10;
		
		private var posX:Number = PADDING;
		private var posY:Number = PADDING;
		
		/**
			Conserva la posizione.
			@see kj.display.utils.Align;
		*/
		private var _position:uint;
		public var align:uint;
		
		public function Toolbar(align:uint = Align.HORIZONTAL):void {
			super();
			this.align = align
		}
		
		/**
			Imposta la posizione;
			@see kj.display.utils.Align;
		*/
		public function set position(value:uint):void {
			_position = value;
			rePosition();
		}
		
		public override function addChild(child:DisplayObject):DisplayObject {
			var r:DisplayObject = super.addChild(child);
			child.x = posX;
			child.y = posY;
			if (align == Align.HORIZONTAL) {
				posX += child.width + PADDING;
			} else if (align == Align.VERTICAL) {
				posY += child.height + PADDING;
			}
			redrawBg();
			rePosition();
			return r;
		}
		protected function redrawBg():void {
			graphics.clear();
			graphics.beginFill(0, 0.5);
			graphics.drawRoundRect(0, 0, width + PADDING *2, height + PADDING *2, 10, 10);
			graphics.endFill();
		}
		private function rePosition():void {
			if (_position == Align.TOP_LEFT) {
				x = PADDING;
				y = PADDING;
			} else if (_position == Align.TOP_RIGHT) {
				x = Main.istance.stage.stageWidth - width - PADDING;
				y = PADDING;
			} else if (_position == Align.BOTTOM_RIGHT) {
				x = Main.istance.stage.stageWidth - width - PADDING;
				y = Main.istance.stage.stageHeight - height - PADDING;
			}
		}
		public function set autoHide(value:Boolean):void {
			if (value) {
				/*	1) trova il lato giusto (quello più vicino	*/
					var distFromTop:Number = y;
					var distFromRight:Number = Main.istance.stage.stageWidth - (x + width);
					var distFromLeft:Number = x;
					var distFromBottom:Number = Main.istance.stage.stageHeight - (y + height);
					if (distFromTop <= distFromRight && distFromTop <= distFromLeft && distFromTop <= distFromBottom) {
						//Debug.log("Nearest is top");
					} else if (distFromBottom <= distFromRight && distFromBottom <= distFromLeft && distFromBottom <= distFromTop) {
						//Debug.log("Nearest is bottom");
					} else if (distFromRight <= distFromTop && distFromRight <= distFromLeft && distFromRight <= distFromBottom) {
						//Debug.log("Nearest is right");
					} else if (distFromLeft <= distFromRight && distFromLeft <= distFromTop && distFromLeft <= distFromBottom) {
						//Debug.log("Nearest is left");
					}
				/*	1) mandarlo fuori stage (dal lato giusto)
					tweenOut();
					2) calcolare hit area (metterci una sprite invisibile?) */
					//var p:Sprite = placeholder;
					//parent.addChild(p);
					/* 3) tweenz s*/
				
				//Debug.log(distFromRight + ", " + distFromBottom);
			} else {
				rePosition();
			}
		}
		
		private function get placeholder():Sprite {
			var p:Sprite = new Sprite();
			p.graphics.beginFill(0, 1);
			p.graphics.drawRect(0, 0, width, height);
			p.graphics.endFill();
			return p;
		}
	}
}