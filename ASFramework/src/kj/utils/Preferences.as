package kj.utils
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
    /**
     * A Class to easily save preferences for your Application.
     * @author kajyr - http://www.nightdrops.com
     */
    public class Preferences
    {
        /**
         * The name of the file in the ApplicationStorageDirectory.
         * Actually there isn't a reason to change it.
         */
        public static var FILENAME:String = "preferences.xml";
        private static var doc:XML;
        
		/**
         * The set method sets a specific preference to a value.
         * @param prefName the name of the preference
         * @param value the value itself.
         */
        public static function set(prefName:String, value:String):void {
        	if (root.child(prefName)[0] == null) {
        		root.appendChild(XML("<" + prefName + ">" + value + "</" + prefName + ">"));
        	} else {
        		root.child(prefName)[0] = value;
        	} 
        	save();
        }
        
		/**
         * The get method returns the value for a specific preference.
         * @param prefName the name of the preference.
         * @param def the default value in case the preference for prefName has not been set. Note that it will be casted as string
         * @return the value of the prefName preference or def.
         * 
         */
        public static function get(prefName:String, fallbackValue:Object = null):String {
        	var r:String = root.child(prefName).text();
        	if (r) return r;
            return fallbackValue.toString();
        }
        
        /**
         * Pretty self explaining, isn't it? 
         */
        private static function save():void {
        	var stream:FileStream = new FileStream();
   			stream.open(PreferencesFile, FileMode.WRITE);
   			stream.writeUTFBytes(doc);
   			stream.close();
        }

        /**
         * The root element of the xml.
         * If it doesn't exist (that's because you'll never saved a preference before) it creates a new xml. 
         * @return The preference.xml file's root element.
         */
        private static function get root():XML 
        {
                if (doc == null)
                {
                	var stream:FileStream = new FileStream();
                	if (PreferencesFile.exists) {	
   						stream.open(PreferencesFile, FileMode.READ);
                    	doc = new XML(stream.readUTFBytes(stream.bytesAvailable));
                	} else {
                		stream.open(PreferencesFile, FileMode.WRITE);
                		doc = <preferences><root></root></preferences>;
                		stream.writeUTFBytes(doc);
                	}
                    stream.close();
                }
                return doc..root[0];
        }
        private static function get PreferencesFile():File {
        	return File.applicationStorageDirectory.resolvePath(FILENAME);
        }
    }
}

