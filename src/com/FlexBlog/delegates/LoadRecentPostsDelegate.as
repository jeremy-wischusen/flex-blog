package com.FlexBlog.delegates
{
    import flash.errors.SQLError;

    import mx.rpc.IResponder;
    import mx.rpc.events.FaultEvent;
    import mx.rpc.events.ResultEvent;

    import sql.FlexBlogDatabaseManager;

    public class LoadRecentPostsDelegate
    {
        private var responder:IResponder
        public function LoadRecentPostsDelegate(responder:IResponder)
        {
            this.responder = responder;
        }
        public function loadRecentPosts():void{
            var dbManager:FlexBlogDatabaseManager = FlexBlogDatabaseManager.getInstance();
            try{
                var posts:Array = dbManager.getRecentPosts();
                var event:ResultEvent = new ResultEvent(ResultEvent.RESULT,false,true,{posts:posts})
                this.responder.result(event)
            }catch(error:SQLError){
                var faultEvent:FaultEvent = new FaultEvent(FaultEvent.FAULT);
                this.responder.fault(faultEvent);
            }
        }

    }
}