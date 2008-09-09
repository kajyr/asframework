package kj.collections
{	
	import flash.data.SQLConnection;
	import flash.data.SQLResult;
	import flash.data.SQLStatement;
	import flash.events.SQLErrorEvent;
	import flash.events.SQLEvent;
	import flash.filesystem.File;
	
	import com.carlcalderon.arthropod.Debug;
		
	public class SQLiteWrapper
	{
		private var conn:SQLConnection;
		
		public function SQLiteWrapper(db:File, onDBOpened:Function = null):void
		{
			conn = new SQLConnection();
			if (onDBOpened != null) conn.addEventListener(SQLEvent.OPEN, onDBOpened);
			conn.addEventListener(SQLErrorEvent.ERROR, onErr);
			conn.openAsync(db);
		}
		private function onErr(event:SQLErrorEvent):void {
			Debug.error("SQLite Error: " + event.error);
		}
			
		public function query(sql:String, onResult:Function = null):void {
			Debug.log(sql, Debug.GREEN);
			var myQuery:SQLStatement = new SQLStatement()
			myQuery.sqlConnection = conn;
			myQuery.text = sql;
			if (onResult != null) myQuery.addEventListener(SQLEvent.RESULT, onResult);
			myQuery.addEventListener(SQLErrorEvent.ERROR, onErr);
			myQuery.execute();
		}
	}
}