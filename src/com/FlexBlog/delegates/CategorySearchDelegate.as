package com.FlexBlog.delegates
{
    import com.FlexBlog.valueobjects.CategoryVO;

    import flash.errors.SQLError;

    import mx.rpc.IResponder;
    import mx.rpc.events.FaultEvent;
    import mx.rpc.events.ResultEvent;

    import sql.FlexBlogDatabaseManager;

    public class CategorySearchDelegate
    {
        private var responder:IResponder
        public function CategorySearchDelegate(responder:IResponder)
        {
            this.responder = responder
        }
        public function search(category:CategoryVO):void{
            var dbManager:FlexBlogDatabaseManager = FlexBlogDatabaseManager.getInstance();
            try{
            var posts:Array =  dbManager.getPostsByCategory(category);
            var event:ResultEvent = new ResultEvent(ResultEvent.RESULT,false,true,{posts:posts})
            this.responder.result(event)
            }catch(error:SQLError){
                var faultEvent:FaultEvent = new FaultEvent(FaultEvent.FAULT);
                this.responder.fault(faultEvent);
            }
        }

    }
}