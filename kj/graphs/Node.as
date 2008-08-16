package kj.graphs{
	import kj.collections.LinkedList;
	import kj.collections.LinkedListIterator;
	import kj.events.LinkedListEvent;
	import kj.events.NodeEvent;
	import flash.events.Event;

	import flash.events.EventDispatcher;
	/*
	
	Fornisce gli elementi base di interazione per una rete di componenti;
	archi, eventi per il movimento e per l'aggiornamento.
	
	*/
	public class Node extends EventDispatcher {

		protected var id:Object;
		public var color:uint=0x000000;
		public static const UPDATED:String="updated";
		public var arcs:Array;


		public function Node(_id:Object,v:Array=null) {
			id=_id;
			arcs=new Array  ;
			/*
			vicini.addEventListener(LinkedListEvent.ITEM_ADDED, function(event:LinkedListEvent):void {  });
			vicini.addEventListener(LinkedListEvent.ITEM_REMOVED, function(event:LinkedListEvent):void {  });
			*/
		}
		public function addArc(dest:Node,weight:Number = 0,color:uint=0x000000):void {
			arcs.push(new Arc(this, dest,weight,color));
			dispatchEvent(new NodeEvent(NodeEvent.ADDED_NEIGHBOUR,dest));
		}

		public function removeArc(dest:Node):Boolean {
			for each (var arc:Arc in arcs) {
				if (arc.destination == dest) {
					arcs.splice(arcs.indexOf(arc),1);
					dispatchEvent(new NodeEvent(NodeEvent.REMOVED_NEIGHBOUR,dest));
					return true;
				}
			}
			return false;
		}
		public function getArc(dest:Node):Arc {
			for each (var arc:Arc in arcs) {
				if (arc.destination == dest) {
					return arc;
				}
			}
			return null;
		}
		public override  function toString():String {
			return id.toString();
		}
	}
}