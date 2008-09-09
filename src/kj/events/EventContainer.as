package kj.events {
	import flash.events.Event;

	/**
	 * Estende Event e contiene un ulteriore oggetto.
	 * @see kj.graphs.Node
	 */
	public class EventContainer extends Event {
		/**
		 * L'oggetto contenuto.
		 * <p>&Egrave; differente da <code>event.target</code>,
		 * per esempio in un evento di tipo <code>ADDED_NEIGHBOUR</code>,
		 * <code>element</code> contiene il nuovo nodo aggiunto all'elenco dei neighbours</p>
		 */
		public var element:Object;
		/**
		 * @param type Il tipo di NodeEvent
		 * @param elem Il nodo coinvolto nell'evento
		 */
		public function EventContainer(type:String,elem:Object) {
			super(type);
			element=elem;
		}
	}
}