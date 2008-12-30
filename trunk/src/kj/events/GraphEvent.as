package kj.events
{
	import kj.graphs.Node;

	public class GraphEvent extends EventContainer
	{
		public static  const ADDED_NODE:String="added_node";
		public static  const REMOVED_NODE:String="removed_node";
		
		public static  const ADDED_ARC:String="added_arc";
		public static  const REMOVED_ARC:String="removed_arc";
		
		public function GraphEvent(type:String, element:Object)
		{
			super(type, element);
		}
		
	}
}