package com.FlexBlog.delegates
{
    import flash.errors.SQLError;

    import mx.rpc.IResponder;
    import mx.rpc.events.FaultEvent;
    import mx.rpc.events.ResultEvent;

    import sql.FlexBlogDatabaseManager;

    public class LoadCategoriesDelegate
    {
        private var responder:IResponder;
        public function LoadCategoriesDelegate(responder:IResponder)
        {
            this.responder = responder;
        }
        public function loadCategories():void{
            var dbManager:FlexBlogDatabaseManager = FlexBlogDatabaseManager.getInstance();
            try{
                var categories:Array = dbManager.getCategories();
                var event:ResultEvent = new ResultEvent(ResultEvent.RESULT,false,true,{categories:categories})
                this.responder.result(event)
            }catch(error:SQLError){
                var faultEvent:FaultEvent = new FaultEvent(FaultEvent.FAULT);
                this.responder.fault(faultEvent);
            }
        }

    }
}