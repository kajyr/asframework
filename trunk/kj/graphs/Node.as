package kj.graphs {
	import kj.collections.LinkedList;
	import kj.collections.LinkedListIterator;
	import kj.events.LinkedListEvent;
	import kj.events.NodeEvent;
	import flash.events.Event;
	
	import flash.events.EventDispatcher;
	/*
	
	Fornisce gli elementi base di interazione per una rete di componenti;
	archi, eventi per il movimento e per l'aggiornamento.
	Possibilmente ma ci devo ancora ragionare, elementi grafici quali disegna linee.
	
	E' fatta per essere overloadata.
	
	*/
	public class Node extends EventDispatcher{

		public var vicini:LinkedList;
		protected var id:Object;
		public var color:uint = 0x000000;
		public static const UPDATED:String = "updated";
		
		
		public function Node(_id:Object, v:Array = null) {
			id = _id;
			vicini = new LinkedList();
			vicini.addEventListener(LinkedListEvent.ITEM_ADDED, function(event:LinkedListEvent):void { dispatchEvent(new NodeEvent(NodeEvent.ADDED_NEIGHBOUR, Node(event.element))) });
			vicini.addEventListener(LinkedListEvent.ITEM_REMOVED, function(event:LinkedListEvent):void { dispatchEvent(new NodeEvent(NodeEvent.REMOVED_NEIGHBOUR, Node(event.element))) });
		}
		
		public function addNeighbour(n:Node) {
			if (n == this) return;
			//ci starebbe un controllo sui doppi, eh
			vicini.enqueue(n);
		}

		public function removeNeighbour(n:Node):void {
			vicini.remove(n);
		}
		
		public override function toString():String {
			return id.toString();
		}
	}
}