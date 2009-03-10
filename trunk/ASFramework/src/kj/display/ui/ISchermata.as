package kj.display.ui
{
	import flash.events.Event;
	
	/**
	 * Rappresenta la Schermata di una applicazione (per es un Totem).
	 * Contiene i metodi per caricare gli elementi, per caricarsi a schermo evitando il flickeraggio dello sfondo.
	 * Il costruttore si occupa di caricare in memoria tutto il necessario: l'immagine di sfondo e i vari componenti.
	 * E' necessario che venga intercettato l'evento Event.COMPLETE relativo al caricamento dello sfondo, per chiamare la funzione init.
	 * 
	 * @todo Gestire la perdita di focus (tramite gli eventi FocusEvent):
	 * serve una funzione che quando perdo il focus metta in pausa tutto quello che c'è attacato (video, mp3 etc). 
	 * @author kajyr
	 * 
	 */
	public interface ISchermata
	{
		/**
		 * Viene eseguita in risposta all'evento Event.COMPLETE del caricamento dello sfondo.
		 * Si occupa di aggangiare tutti i componenti.
		 * Questo evita che i componenti compaiano sullo schermo prima dello sfondo, che è brutto.
		 * @param e L'evento lanciato dal completamento del caricamento dello sfondo.
		 * 
		 */
		function initComponents(e:Event):void;
	}
}