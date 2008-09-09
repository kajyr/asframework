package kj.graphs{
	import kj.events.NodeEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;

	/**
	 * L'elemento nodo di un grafo.
	 * @see kj.events.NodeEvent
	 */
	public class Node extends EventDispatcher {

		/**
		 * L'identificativo del nodo.
		 */
		protected var id:Object;
		/**
		 * Il colore del nodo
		 */
		public var color:uint=0x000000;
		/**
		 * L'insieme degli archi uscenti da questo nodo.
		 * Non modificarlo manualmente.
		 */
		public var arcs:Array;

		public static  const UPDATED:String="updated";

		/**
		 * @param id Un identificativo per il nodo.
		 */
		public function Node(id:Object) {
			this.id=id;
			arcs=new Array  ;
		}
		/**
		 * Aggiunge un arco verso un altro nodo.
		 * @param dest Il nodo di destinazione
		 * @param weight Il peso dell'arco
		 * @param color Il colore dell'arco
		 * @see kj.events.NodeEvent
		 */
		public function addArc(dest:Node,weight:Number=0,color:uint=0x000000):void {
			arcs.push(new Arc(this,dest,weight,color));
			dispatchEvent(new NodeEvent(NodeEvent.ADDED_NEIGHBOUR,dest));
		}
		/**
		 * Rimuove un arco verso un altro nodo.
		 * <p>In caso di più archi rimuove il primo.</p>
		 * @param dest Il nodo di destinazione
		 * @return true se l'arco era presente ed è stato eliminato
		 * @see kj.events.NodeEvent
		 */
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
		/**
		 * Permette di ottenere un arco in uscita verso un altro nodo.
		 * <p>Chiaramente l'arco deve esistere tra quelli in uscita dal nodo chiamante.</p>
		 * @param dest Il nodo di destinazione
		 * @return L'oggetto Arc che unisce il nodo chiamante con il nodo dest
		 */
		public function getArc(dest:Node):Arc {
			for each (var arc:Arc in arcs) {
				if (arc.destination == dest) {
					return arc;
				}
			}
			return null;
		}
		/**
		 *  Prints out a string representing the current object.
		 */
		public override function toString():String {
			return id.toString();
		}
	}
}