package kj.events
{
	import flash.events.Event;

	public class LinkedListEvent extends Event
	{
		public static const ITEM_ADDED:String = "itemAdded";
		public static const ITEM_REMOVED:String = "itemRemoved";
		
		public var element:Object;
		
		public function LinkedListEvent(type:String, elem:Object)
		{
			super(type);
			element = elem;
		}
	}
}