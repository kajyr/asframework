package kj.collections {

	public class LinkedListIterator implements IIterator {
		private var head:LinkedListNode;
		private var cur:LinkedListNode;

		public function LinkedListIterator(inizio:LinkedListNode) {
			cur = head = new LinkedListNode(null);
			cur.next = inizio;
		}
		
		public function reset():void {
			cur = head;
		}
		public function get current():Object {
			if (!cur) throw new Error("Shouldn't we get there..");
			return cur.object;
		}
		
		public function hasNext():Boolean {
			return cur && cur.next != null;
		}
		public function hasPrev():Boolean {
			return cur &&  cur.prev != null;
		}
		
		public function prev():Object {
			if (hasPrev()) {
				cur = cur.prev;
				return current;
			} else {
				throw new Error("Cannot iterate more in this direction");
			}
		}
		
		public function next():Object {
			if (hasNext()) {
				cur = cur.next;
				return current;
			} else {
				throw new Error("Cannot iterate more in this direction");
			}
		}
	}
}