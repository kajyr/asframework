package kj.collections {
	
	import flash.events.EventDispatcher;
	import kj.events.LinkedListEvent;

	public class LinkedList extends EventDispatcher {

		protected var front:LinkedListNode;
		protected var back:LinkedListNode;

		public function LinkedList(a:Array = null) {
			front = back = null;
			if (a) {
				for each (var o:Object in a) {
					enqueue(o);
				}
			}
		}
		/**
		* Test if the queue is logically empty.
		* @return true if empty, false otherwise.
		*/
		public function isEmpty():Boolean {
			return front == null;
		}
		/**
		* Insert a new item into the queue.
		* @param x the item to insert.
		*/
		public function enqueue(x:Object):void {
			if ( isEmpty( ) ) {
				back = front = new LinkedListNode( x );
			} else {
				var tmp:LinkedListNode = back;
				back = back.next = new LinkedListNode( x );
				back.prev = tmp;
			}
			dispatchEvent(new LinkedListEvent(LinkedListEvent.ITEM_ADDED, back.object));
		}
		/**
		* Return and remove the least recently inserted item
		* from the queue.
		* @return the least recently inserted item in the queue.
		* @throws UnderflowException if the queue is empty.
		*/
		public function dequeue( ):Object {
			if ( isEmpty( ) ) {
				throw new Error("LinkedList dequeue");
			}
			var tmp:LinkedListNode = back;
			back = back.prev;
			if (back) {
				back.next = null;
			}
			dispatchEvent(new LinkedListEvent(LinkedListEvent.ITEM_REMOVED, tmp.object));
			return tmp.object;
		}
		// add an element to the stack
		public function push(x:Object):void {
			if ( isEmpty( ) ) {
				back = front = new LinkedListNode(x);
			} else {
				var tmp:LinkedListNode = front;
				front = front.prev = new LinkedListNode(x);
				front.next = tmp;
			}
			dispatchEvent(new LinkedListEvent(LinkedListEvent.ITEM_ADDED, front.object));
		}

		// delete and return the most recently added element
		public function pop():Object {
			if (isEmpty()) {
				throw new Error("LinkedList pop");
			}
			var tmp:LinkedListNode = front;
			front = front.next;
			if (front) {
				front.prev = null;
			}
			dispatchEvent(new LinkedListEvent(LinkedListEvent.ITEM_REMOVED, tmp.object));
			return tmp.object;
		}
		
		public function remove(x:Object):Object {
			if (isEmpty()) {
				throw new Error("Cannot remove elements from an empty list");
			}
			var tmp:LinkedListNode = front;
			while (tmp != null) {
				if (tmp.object == x) {
					//Debug.log(tmp.object + " == " + x + " ?: " + (tmp.object == x), Debug.YELLOW);
					if (tmp.prev) {
						tmp.prev.next = tmp.next;
					} else {
						front = front.next;
					}
					//Debug.log((tmp.prev == null) + "", Debug.YELLOW);
					if (tmp.next) {
						tmp.next.prev = tmp.prev;
					}/* else {
						back = back.prev;
					}*/
					dispatchEvent(new LinkedListEvent(LinkedListEvent.ITEM_REMOVED, tmp.object));
					return tmp.object;
				}
				tmp = tmp.next;
			}
			throw new Error("Cannot remove an element that is not in the list");
		}
		/**
		     * Get the least recently inserted item in the queue.
		     * Does not alter the queue.
		     * @return the least recently inserted item in the queue.
		     * @throws UnderflowException if the queue is empty.
		     */
		public function get head( ):Object {
			if ( isEmpty( ) ) {
				throw new Error("ListQueue head");
			}
			return front.object;
		}
		public function get tail( ):Object {
			if ( isEmpty( ) ) {
				throw new Error("ListQueue head");
			}
			return back.object;
		}
		/**
		     * Make the queue logically empty.
		     */
		public function clear( ):void {
			front = null;
			back = null;
			dispatchEvent(new LinkedListEvent(LinkedListEvent.ITEM_REMOVED, null));
		}
		public override function toString():String {
			var s:String = "{";
			var tmp:LinkedListNode = front;
			while (tmp != null) {
				s += tmp + " ";
				tmp = tmp.next;
			}
			s += "}";
			return s;
		}
		public function get iterator():LinkedListIterator {
			return new LinkedListIterator(front); 
		}
	}
}