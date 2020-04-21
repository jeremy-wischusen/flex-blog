package com.FlexBlog.delegates
{
    import com.FlexBlog.valueobjects.PostVO;

    import flash.errors.SQLError;

    import mx.rpc.IResponder;
    import mx.rpc.events.FaultEvent;
    import mx.rpc.events.ResultEvent;

    import sql.FlexBlogDatabaseManager;

    public class LoadCommentsDelegate
    {
        private var responder:IResponder;
        public function LoadCommentsDelegate(responder:IResponder)
        {
            this.responder = responder;
        }
        public function loadComments(post:PostVO):void{
            var dbManager:FlexBlogDatabaseManager = FlexBlogDatabaseManager.getInstance();
            try{
                var comments:Array = dbManager.getComments(post);
                var event:ResultEvent = new ResultEvent(ResultEvent.RESULT,false,true,{comments:comments})
                this.responder.result(event)
            }catch(error:SQLError){
                var faultEvent:FaultEvent = new FaultEvent(FaultEvent.FAULT);
                this.responder.fault(faultEvent);
            }
        }

    }
}