package kj.events{
	import kj.graphs.Node;

	/**
	 * Una classe di eventi legata agli elementi dei grafi.
	 * @see kj.graphs.Node
	 */
	public class NodeEvent extends EventContainer {
		/**
		 * La costante NodeEvent.ADDED_NEIGHBOUR definisce il valore della propriet&agrave;
		 * <code>type</code> di un evento nel caso di un evento <code>ADDED_NEIGHBOUR</code>.
		 *
		 * @eventType added_neighbour
		 */
		public static  const ADDED_NEIGHBOUR:String="added_neighbour";
		/**
		 * La costante NodeEvent.REMOVED_NEIGHBOUR definisce il valore della propriet&agrave;
		 * <code>type</code> di un evento nel caso di un evento <code>REMOVED_NEIGHBOUR</code>.
		 *
		 * @eventType removed_neighbour
		 */
		public static  const REMOVED_NEIGHBOUR:String="removed_neighbour";
		/**
		 * @param type Il tipo di NodeEvent
		 * @param elem Il nodo coinvolto nell'evento
		 */
		public function NodeEvent(type:String,elem:Node) {
			super(type, elem);
		}
	}
}