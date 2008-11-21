﻿package kj.utils
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
    /**
     * 
     * @author kajyr
     * 
     */
    public class Preferences extends StaticClass
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
         * 
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
         * @return the value of the prefName preference.
         * 
         */
        public static function get(prefName:String):String {
            return root.child(prefName).text();
        }
        
        private static function save():void {
        	var stream:FileStream = new FileStream();
   			stream.open(PreferencesFile, FileMode.WRITE);
   			stream.writeUTFBytes(doc);
   			stream.close();
        }

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
