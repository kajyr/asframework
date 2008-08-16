package kj.events
{
	/**
	 * Una classe di eventi legata agli elementi delle linkedList.
	 * @see kj.collections.LinkedList
	 */
	public class LinkedListEvent extends EventContainer
	{
		public static const ITEM_ADDED:String = "itemAdded";
		public static const ITEM_REMOVED:String = "itemRemoved";
		
		public function LinkedListEvent(type:String, elem:Object)
		{
			super(type, elem);
		}
	}
}