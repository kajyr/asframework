package kj.utils
{
    /**
     * 
     * Abstract class which enforces a class of static type is never
     * instantiated. 
     * 
     * <p>
     * All static classes (classes which ONLY contain static members)
     * are to extend AbstractStaticBase. Implementors need not provide
     * any implementation. By extending StaticClass it will be
     * ensured that a class instance can not e instantiated.
     * </p>
     * 
     * <p>
     * Typically, Helper, Utility and Enumeration classes will extend
     * AbstractStaticBase to ensure clients do not misuse an API by
     * explicitly instantiating an instance of the static type
     * </p>
     * 
     * @example
     * <listing version="3.0">
     * 
     * package
     * {
     *     public final class CalculationUtils extends StaticClass
     *     { 
     *         public static function calculateX() : String {
     *             // implementation not relevant
     *         }
     * 
     *         public static function calculateY() : String {
     *             // implementation not relevant
     *         }
     * 
     *         public static function calculateZ() : String {
     *             // implementation not relevant
     *         }
     *     }
     * }
     * 
     * // an attempt to instantiate an instance of CalculationUtils...
     * 
     * var util:CalculationUtils = new CalculationUtils();
     * 
     * // results in the following exception being throw:
     * // Illegal instantiation attempted on class of static type: CalculationUtils
     * 
     * </listing>
     * 
     * 
     */    
    public class StaticClass
    {
        /**
         * Defines the message String which is used as the property of the Exception
         */
        private static const MESSAGE:String = "Illegal instantiation attempted.";

        public function StaticClass()
        {
            throw new Error(MESSAGE);
        }
    }
}

