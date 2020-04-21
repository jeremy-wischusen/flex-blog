package sql
{
    import flash.data.SQLConnection;
    import flash.data.SQLResult;
    import flash.data.SQLStatement;
    import flash.filesystem.File;
    import flash.net.Responder;


    public class SQLiteManager
    {
        protected var connection:SQLConnection = new SQLConnection();
        protected var database:File;
        protected var statement:SQLStatement = new SQLStatement();;
        public var responder:Responder;
        public function SQLiteManager(database:File)
        {
            this.database = database;
            this.connection.open(this.database);
            this.statement.sqlConnection = this.connection;
        }
        public function query(sql:String):SQLResult{
            this.statement.text = sql;
            this.statement.execute(-1,this.responder);
            this.statement.clearParameters();
            this.statement.itemClass = null;
            return this.statement.getResult();
        }

    }
}