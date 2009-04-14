package kj.utils
{
	/**
	 * 
	 * @author kajyr
	 * 
	 */
	public interface IPreferenceManager
	{
		/**
         * The set method sets a specific preference to a value.
         * @param prefName the name of the preference
         * @param value the value itself.
         */
		function set(prefName:String, value:String):void;
		/**
         * The get method returns the value for a specific preference.
         * @param prefName the name of the preference.
         * @return the value of the prefName preference.
         */
        function get(prefName:String):String;
	}
}