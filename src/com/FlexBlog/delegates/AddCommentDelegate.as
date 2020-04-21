package com.FlexBlog.delegates
{
    import com.FlexBlog.valueobjects.CommentVO;

    import flash.errors.SQLError;

    import mx.rpc.IResponder;
    import mx.rpc.events.FaultEvent;
    import mx.rpc.events.ResultEvent;

    import sql.FlexBlogDatabaseManager;

    public class AddCommentDelegate
    {
        private var responder:IResponder;
        public function AddCommentDelegate(responder:IResponder)
        {
            this.responder = responder;
        }
        public function addComment(comment:CommentVO):void{
            var dbManager:FlexBlogDatabaseManager = FlexBlogDatabaseManager.getInstance();
            try{
                var added:int = dbManager.addComment(comment);
                var event:ResultEvent = new ResultEvent(ResultEvent.RESULT,false,true,{added:added})
                this.responder.result(event)
            }catch(error:SQLError){
                var faultEvent:FaultEvent = new FaultEvent(FaultEvent.FAULT);
                this.responder.fault(faultEvent);
            }
        }

    }
}