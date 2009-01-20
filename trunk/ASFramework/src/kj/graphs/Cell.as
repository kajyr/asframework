package kj.graphs {

	import kj.graphs.Node;
	import kj.display.DraggableSprite;
	import kj.events.NodeEvent;
	import flash.events.Event;

	/**
	 * Estende Node per fornire gli elementi per realizzare una Cella di un CA.
	 * Molto da sistemare
	 * @see Node
	*/
	public class Cell extends Node {

		public var display:DraggableSprite;
		public static const MOVING:String = "moving";
		public static const MOVED:String = "moved";
		protected var archi:Array;

		public function Cell(id:Object):void {
			super(id);
			archi = new Array();
			display = new DraggableSprite();
			display.addEventListener(DraggableSprite.START_DRAG, onMoving);
			display.addEventListener(DraggableSprite.STOP_DRAG, onMoved);
			addEventListener(NodeEvent.ADDED_NEIGHBOUR, onNodeAdded);
			addEventListener(NodeEvent.REMOVED_NEIGHBOUR, onNodeRemoved);
		}

		private function onNodeAdded(event:NodeEvent):void {
			var c:Cell = Cell(event.element);
			c.addEventListener(Cell.MOVING, onNeighbourMoving);
			c.addEventListener(Cell.MOVED, onNeighbourMoved);
			link(c);
		}
		private function onNodeRemoved(event:NodeEvent):void {
			var c:Cell = Cell(event.element);
			c.removeEventListener(Cell.MOVING, onNeighbourMoving);
			c.removeEventListener(Cell.MOVED, onNeighbourMoved);
			unlink(c);
		}
		private function onMoving(event:Event):void {
			dispatchEvent(new NodeEvent(Cell.MOVING, this));
			for each (var arc:Arc in arcs) {
				unlink(arc.destination as Cell);
			}
		}
		private function onMoved(event:Event):void {
			dispatchEvent(new NodeEvent(Cell.MOVED, this));
			for each (var arc:Arc in arcs) {
				link(arc.destination as Cell);
			}
		}
		private function onNeighbourMoving(event:NodeEvent):void {
			unlink(event.element as Cell);
		}
		private function onNeighbourMoved(event:NodeEvent):void {
			link(event.element as Cell);
		}
		protected function link(c:Cell):void {
			if (archi[c]) {
				//throw new Error("Arco (" + this + ", " + c + ") gia esistente");
				unlink(c);
			}
		}
		protected function unlink(c:Cell):void {}
	}
}