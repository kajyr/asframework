package kj.collections {
	
	import flash.events.EventDispatcher;
	import flash.events.Event;
	
	public class LinkedListNode extends EventDispatcher {
		
		protected var obj:Object;
		public var next:LinkedListNode;
		public var prev:LinkedListNode;
		
		public function LinkedListNode(o:Object) {
			//if (!o) throw new Error("LinkedListNode: Cannot istantiate null object"); 
			obj = o;
		}
		
		public function get object():Object {
			return obj;
		}
		
		public override function toString():String {
			return obj.toString();
		}
	}
}

	