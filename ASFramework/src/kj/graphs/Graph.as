package kj.graphs {
	
	import flash.events.EventDispatcher;
	import flash.utils.Dictionary;
	
	import kj.collections.ICollection;
	import kj.collections.IIterator;
	import kj.events.GraphEvent;
	
	/**
	 * A linked uni-directional weighted graph structure.
	 * 
	 * The Graph class manages all graph nodes. Each graph node has an array
	 * of arcs, pointing to different nodes.
	 */
	public class Graph extends EventDispatcher implements ICollection
	{
		/**
	 	 * The graph's nodes.
	 	 */
		public var nodes:Array;
		/**
		 * L'insieme degli archi uscenti da questo nodo.
		 * Non modificarlo manualmente, altrimenti non partono i dispatch
		 */
		public var arcs:Dictionary;

		
		/**
		 * Creates an empty graph.
		 * 
		 * @param size The total number of nodes the graph can hold.
		 */
		public function Graph()
		{
			nodes = new Array();
			arcs = new Dictionary;
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
		*/
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
		*/
		/**
		 * Adds a node at a given index to the graph.
		 * 
		 * @param obj The data to store in the node.
		 * @param i   The index the node is stored at.
		 * 
		 * @return True if a node was added, otherwise false.
		 */
		public function addNode(node:INode):void
		{
			nodes.push(node);
			arcs[node] = new Array();
			dispatchEvent(new GraphEvent(GraphEvent.ADDED_NODE, node));
		}
		
		/**
		 * Removes a node from the graph at a given index.
		 * 
		 * @param index The node's index.
		 * @param detach Should detach the node from others?
		 * 
		 * @return True if removal was successful, otherwise false.
		 */
		public function removeNode(node:INode, detach:Boolean = true):INode
		{
			nodes.splice(nodes.indexOf(node), 1);
			if (detach && arcs[node]) {
				delete arcs[node];
			}
			dispatchEvent(new GraphEvent(GraphEvent.REMOVED_NODE, node));
			return node;
		}
		/**
		 * Aggiunge un arco verso un altro nodo.
		 * Problema: bisognerebbe verificare che il secondo nodo sia nel grafo
		 * @param dest Il nodo di destinazione
		 * @param weight Il peso dell'arco
		 * @param color Il colore dell'arco
		 * @see kj.events.NodeEvent
		 */
		public function addArc(src:INode, dest:INode,weight:Number=0,color:uint=0):void {
			var a:Arc = new Arc(src,dest,weight,color);
			arcs[src].push(a);
			dispatchEvent(new GraphEvent(GraphEvent.ADDED_ARC, a));
		}
		/**
		 * Rimuove un arco verso un altro nodo.
		 * <p>In caso di più archi rimuove il primo.</p>
		 * @param dest Il nodo di destinazione
		 * @return true se l'arco era presente ed è stato eliminato
		 * @see kj.events.GraphEvent
		 */
		public function removeArc(src:INode, dest:INode):void {
			if (!arcs[src]) return;
			for each (var arc:Arc in arcs[src]) {
				if (arc.destination == dest) {
					arcs.splice(arcs.indexOf(arc),1);
					dispatchEvent(new GraphEvent(GraphEvent.REMOVED_ARC, arc));
				}
			}
		}
		/**
		 * Permette di ottenere un arco in uscita verso un altro nodo.
		 * <p>Chiaramente l'arco deve esistere tra quelli in uscita dal nodo chiamante.</p>
		 * @param src Il nodo sorgente
		 * @param dest Il nodo di destinazione
		 * @return L'oggetto Arc che unisce il nodo chiamante con il nodo dest
		 */
		public function getArc(src:INode, dest:INode):Arc {
			for each (var arc:Arc in arcs[src]) {
				if (arc.destination == dest) {
					return arc;
				}
			}
			return null;
		}
		
		/**
		 * All the nodes that are linked by the src node 
		 * @param src
		 * @return 
		 * 
		 */
		public function outgoingNeighbours(src:INode):Array {
			var r:Array = new Array();
			for each(var a:Arc in arcs[src]) r.push(a.destination);
			return r;
		}
		/**
		 * All the nodes that links to dest
		 * TODO: lento, direi.
		 * @param dest
		 * @return 
		 * 
		 */
		public function incomingNeighbours(dest:INode):Array {
			var r:Array = new Array();
			for each (var n:INode in nodes) {
				for each(var a:Arc in arcs[n]) {
					if (a.destination === dest) r.push(a.source);
				}
			}
			return r;
		}
		
		/**
		 * All the nodes that link or are linked by src. 
		 * @param src
		 * @return 
		 * 
		 */
		public function neighbours(src:INode):Array {
			return incomingNeighbours(src).concat(outgoingNeighbours(src));
		}
		
		/**
		 * Marks are used to keep track of the nodes that have been visited
		 * during a depth-first or breadth-first traversal. You must call this
		 * method to clear all markers before starting a new traversal.
		 
		private function clearMarks():void
		{
			for each(var node:Node in nodes) {
				node.marked = false;
			}
		}
		*/
		/**
		 * @inheritDoc
		 */		
		public function contains(obj:*):Boolean
		{
			for each(var node:INode in nodes) {
				if (node == obj) return true;  
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
			for each(var node:INode in nodes) {
				a.push(node);
			}
			return a;
		}
		/**
		 *  Prints out a string representing the current object.
		 */
		public override function toString():String {
			var out:String = "";
			for each(var n:INode in nodes) {
				out += n;
				if ((arcs[n] as Array).length > 0) out += " -> " + outgoingNeighbours(n).join(',');
				out += '\n';
			}
			return out;
		}
	}
}

import kj.collections.IIterator;
import kj.graphs.Graph;
import kj.graphs.INode;

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
			var item:INode = _nodes[_cursor];
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