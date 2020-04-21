package com.FlexBlog.delegates
{
    import com.FlexBlog.valueobjects.PostVO;

    import flash.errors.SQLError;

    import mx.rpc.IResponder;
    import mx.rpc.events.FaultEvent;
    import mx.rpc.events.ResultEvent;

    import sql.FlexBlogDatabaseManager;

    public class AddPostDelegate
    {
        private var responder:IResponder;
        public function AddPostDelegate(responder:IResponder)
        {
            this.responder = responder;
        }
        public function addPost(post:PostVO):void{
            var dbManager:FlexBlogDatabaseManager = FlexBlogDatabaseManager.getInstance();
            try{
                var added:int = dbManager.addPost(post);
                var event:ResultEvent = new ResultEvent(ResultEvent.RESULT,false,true,{added:added})
                this.responder.result(event)
            }catch(error:SQLError){
                var faultEvent:FaultEvent = new FaultEvent(FaultEvent.FAULT);
                this.responder.fault(faultEvent);
            }
        }

    }
}