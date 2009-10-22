package  kj.graphs.algorithms
{
	import flash.utils.Dictionary;
	import kj.graphs.Graph;
	import kj.graphs.INode;
	import com.carlcalderon.arthropod.Debug;
	/**
	 * ...
	 * @author panzic
	 */
	public class DepthFirstSearch extends GraphsAlgorithm
	{
		/**
		 * 
		 * @param	root The root node.
		 * @param	options
		 * 				onEncounter: function to be called every time a node is encountered.
		 * 				onEnqueue: function to be called every time a node is enqueued.
		 *				onLeave: function to be called every time a node analisis is finished.
		 * 				
		 */
		public static function run(root:INode, graph:Graph, options:Object = null):void
		{
			if (options == null) options = new Object();
			var queue:Array = new Array();
			var colors:Dictionary = new Dictionary();
			colors[root] = GraphsAlgorithm.GREY;
			queue.push(root);
			while (queue.length > 0) {
				var head:INode = queue.pop() as INode;
				if (options.onEncounter) options.onEncounter(head);
				var out:Array = graph.outgoingNeighbours(head);
				for each (var n:INode in out) {
					if (colors[n] != null) continue;
					colors[n] = GraphsAlgorithm.GREY;
					if (options.onEnqueue) options.onEnqueue(n);
					queue.push(n);
				}
				colors[head] = GraphsAlgorithm.BLACK;
				if (options.onLeave) options.onLeave(head);
			}
		}
		
	}

}