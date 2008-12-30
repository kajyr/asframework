package kj.graphs {

	/**
	*	Unisce due nodi con un peso e un colore (opzionali)
	*/
	public class Arc {

		private var _src:Node;
		private var _dest:Node;
		/**
		 * Il peso dell'arco
		 */
		private var weight:Number;
		/**
		 * Il colore dell'arco
		 */
		public var color:uint;
		
		public function Arc(src:Node, dest:Node, weight:Number = 0, color:uint = 0x000000) {
			if (!src) throw new Error("Cannot create an arc from an empty Node");
			if (!dest) throw new Error("Cannot create an arc to an empty Node");
			_src = src;
			_dest = dest;
			this.weight = weight;
			this.color = color;
		}
		
		public function get source():Node {
			return _src;
		}
		public function get destination():Node {
			return _dest;
		}
		public function toString():String {
			return "[" + _src + " -> " + _dest + "]";
		}
	}
}