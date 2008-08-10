package kj.graphs {

	/**
	*	Classe Arco: contiene due nodi e il peso dell'arco
	*/
	public class Arc {

		private var _src:Node;
		private var _dest:Node;
		private var _weight:Number;
		
		public function Arc(src:Node, dest:Node, weight:Number = 0) {
			throw new Error("Use of the Arc class is deprecated");
			if (!src) throw new Error("Cannot create an arc from an empty Node");
			if (!dest) throw new Error("Cannot create an arc to an empty Node");
			_src = src;
			_dest = dest;
			_weight = weight;
		}
		
		public function get source():Node {
			return _src;
		}
		public function get destination():Node {
			return _dest;
		}
		public function get weight():Number {
			return _weight;
		}
		public function toString():String {
			return "(" + source + " -> " + destination + ")";
		}
		public function traceArc():void {
			trace(this);
		}
	}
}