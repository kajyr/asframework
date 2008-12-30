package kj.graphs{ 
	/* import kj.events.GraphEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher; */

	/**
	 * L'elemento nodo di un grafo.
	 * @see kj.events.NodeEvent
	 */
	public class Node extends Object {

		/**
		 * L'identificativo del nodo.
		 */
		public var data:Object;
		/**
		 * Il colore del nodo
		 */
		public var color:uint=0x000000;
		/**
		 * Usata per tenere traccia delle visite durante gli algoritmi sui grafi
		 */
		//public var marked:Boolean;
		
		//public static const UPDATED:String="updated";
		/**
		 * @param id Un identificativo per il nodo.
		 */
		public function Node(data:Object) {
			this.data=data;
		}
		
		/**
		 *  Prints out a string representing the current object.
		 *  Brackets means that the element is contained in a node.
		 */
		public /* override */ function toString():String {
			return "(" + data.toString() + ")";
		}
	}
}