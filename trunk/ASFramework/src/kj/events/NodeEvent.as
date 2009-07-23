package kj.events
{
	import flash.events.Event;

	public class NodeEvent extends Event
	{
		public static  const ACTIVATED:String="activated";
		
		public function NodeEvent(type:String)
		{
			super(type);
		}
		
	}
}