package kj.graphs {

	/**
	*	Unisce due nodi con un peso e un colore (opzionali)
	*/
	public class Arc {

		private var _src:INode;
		private var _dest:INode;
		/**
		 * Il peso dell'arco
		 */
		public var weight:Number;
		/**
		 * Il colore dell'arco
		 */
		public var color:uint;
		
		public function Arc(src:INode, dest:INode, weight:Number = 0, color:uint = 0) {
			if (!src) throw new Error("Cannot create an arc from an empty INode");
			if (!dest) throw new Error("Cannot create an arc to an empty INode");
			_src = src;
			_dest = dest;
			this.weight = weight;
			this.color = color;
		}
		
		public function get source():INode {
			return _src;
		}
		public function get destination():INode {
			return _dest;
		}
		public function toString():String {
			//return destination + "";
			return "[" + _src + " -> " + _dest + "]";
		}
	}
}