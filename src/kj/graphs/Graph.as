package kj.graphs {
	
	import kj.collections.ICollection;
	import kj.collections.IIterator;
	/**
	 * A linked uni-directional weighted graph structure.
	 * 
	 * The Graph class manages all graph nodes. Each graph node has an array
	 * of arcs, pointing to different nodes.
	 */
	public class Graph implements ICollection
	{
		/**
	 	 * The graph's nodes.
	 	 */
		public var nodes:Array;
		
		private var _nodeCount:int;
		
		/**
		 * Creates an empty graph.
		 * 
		 * @param size The total number of nodes the graph can hold.
		 */
		public function Graph()
		{
			nodes = new Array();
		}
		
		/**
		 * Performs an iterative depth-first traversal starting at a given node.
		 * 
		 * @example The following code shows an example callback function.
		 * The graph traversal runs until the value '5' is found in the data
		 * property of a node instance.
		 * <listing version="3.0">
		 * var visitNode:Function = function(node:Node):Boolean
		 * {
		 *     if (node.data == 5)
		 *         return false; //terminate traversal
		 *     return true;
		 * }
		 * myGraph.depthFirst(graph.nodes[0], visitNode);
		 * </listing>
		 * 
		 * @param node  The graph node at which the traversal starts.
		 * @param visit A callback function which is invoked every time a node
		 *              is visited. The visited node is accessible through
		 *              the function's first argument. You can terminate the
		 *              traversal by returning false in the callback function.
		 */
		public function depthFirst(node:Node, visit:Function):void
		{
			if (!node) return;
			clearMarks();
			
			var stack:Array = [node];
			var c:int = 1, k:int, i:int;
			var arcs:Array;
			
			var n:Node;
			while (c > 0)
			{
				n = stack[--c];
				if (n.marked) continue;
				n.marked = true;
				
				visit(n);
				
			    k = n.numArcs, arcs = n.arcs; 
				for (i = 0; i < k; i++)
					stack[c++] = arcs[i].node;
			}
		}
		
		/**
		 * Performs a breadth-first traversal starting at a given node.
		 * 
		 * @example The following code shows an example callback function.
		 * The graph traversal runs until the value '5' is found in the data
		 * property of a node instance.
		 * <listing version="3.0">
		 * var visitNode:Function = function(node:Node):Boolean
		 * {
		 *     if (node.data == 5)
		 *         return false; //terminate traversal
		 *     return true;
		 * }
		 * myGraph.breadthFirst(graph.nodes[0], visitNode);
		 * </listing>
		 * 
		 * @param node  The graph node at which the traversal starts.
		 * @param visit A callback function which is invoked every time a node
		 *              is visited. The visited node is accessible through
		 *              the function's first argument. You can terminate the
		 *              traversal by returning false in the callback function.
		 */
		public function breadthFirst(node:Node, visit:Function):void
		{
			if (!node) return;
			clearMarks();
			
			var que:Array = new Array(0x10000);
			var divisor:int = 0x10000 - 1;
			var front:int = 0;
			
			que[0] = node; 
			
			node.marked = true;
			
			var c:int = 1, k:int, i:int;
			var arcs:Array;
			
			var v:Node;
			var w:Node;
			
			while (c > 0)
			{
				v = que[front];
				if (!visit(v)) return;
				
				arcs = v.arcs, k = v.numArcs;
				for (i = 0; i < k; i++)
				{
					w = arcs[i].node;
					
					if (w.marked) continue;
					w.marked = true;
					que[int((c++ + front) & divisor)] = w;
				}
				
				if (++front == 0x10000) front = 0;
				c--;
			}
		}
		
		/**
		 * Adds a node at a given index to the graph.
		 * 
		 * @param obj The data to store in the node.
		 * @param i   The index the node is stored at.
		 * 
		 * @return True if a node was added, otherwise false.
		 */
		public function addNode(node:Node):void
		{
			nodes.push(node);
		}
		
		/**
		 * Removes a node from the graph at a given index.
		 * 
		 * @param index The node's index.
		 * @param detach Should detach the node from others?
		 * 
		 * @return True if removal was successful, otherwise false.
		 */
		public function removeNode(node:Node, detach:Boolean = true):Node
		{
			nodes.splice(nodes.indexOf(node), 1);
			
			if (detach) {
				for each(var n:Node in nodes) {
					n.removeArc(node);
				}
			}
			
			return node;
			
			if (!node) return false;
		}
		
		/**
		 * Marks are used to keep track of the nodes that have been visited
		 * during a depth-first or breadth-first traversal. You must call this
		 * method to clear all markers before starting a new traversal.
		 */
		private function clearMarks():void
		{
			for each(var node:Node in nodes) {
				node.marked = false;
			}
		}
		
		/**
		 * @inheritDoc
		 */		
		public function contains(obj:*):Boolean
		{
			for each(var node:Node in nodes) {
				if (node.data == obj) return true;  
			}
			return false;
		}
		
		/**
		 * @inheritDoc
		 */
		public function clear():void
		{
			nodes = new Array();
		}

		/**
		 * @inheritDoc
		 */
		public function get Iterator():IIterator
		{
			return new GraphIterator(this);		
		}
		
		/**
		 * @inheritDoc
		 */
		public function get length():uint
		{
			return nodes.length;
		}
		
		/**
		 * @inheritDoc
		 */
		public function isEmpty():Boolean
		{
			return length == 0;
		}
		
		/**
		 * @inheritDoc
		 */
		public function toArray():Array
		{
			var a:Array = [];
			for each(var node:Node in nodes) {
				a.push(node);
			}
			return a;
		}
	}
}

import kj.collections.IIterator;
import kj.graphs.Graph;
import kj.graphs.Node;

internal class GraphIterator implements IIterator
{
	private var _nodes:Array;
	private var _cursor:int;
	private var _size:int;

	public function GraphIterator(graph:Graph)
	{
		_nodes = graph.nodes;
		_size = graph.length;
	}
	
	public function get data():*
	{
		var n:Node = _nodes[_cursor];
		if (n) return n.data;
	}

	public function set data(obj:*):void
	{
		var n:Node = _nodes[_cursor];
		if (n) n.data = obj;
	}
	
	public function start():void
	{
		_cursor = 0;
	}
	
	public function hasNext():Boolean
	{
		return _cursor < _size;
	}

	public function next():Object
	{
		if (_cursor < _size)
		{
			var item:* = _nodes[_cursor];
			if (item)
			{
				_cursor++;
				return item;
			}
			
			while (_cursor < _size)
			{
				item = _nodes[_cursor++];
				if (item) return item;
			}
		}
		return null;
	}
}