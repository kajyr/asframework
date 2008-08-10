package kj.events
{
	import flash.events.Event;
	import kj.graphs.Node;
	
	public class NodeEvent extends Event
	{
		public static const ADDED_NEIGHBOUR:String = "added_neighbour";
		public static const REMOVED_NEIGHBOUR:String = "removed_neighbour";
		
		public var element:Node;
		
		public function NodeEvent(type:String, elem:Node)
		{
			super(type);
			element = elem;
		}
	}
}