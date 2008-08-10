package kj.collections {

	public interface IIterator {
		function reset():void;
		function hasNext():Boolean;
		function next():Object;
	}
}