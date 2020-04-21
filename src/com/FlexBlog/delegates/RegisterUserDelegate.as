package com.FlexBlog.delegates
{
    import com.FlexBlog.valueobjects.UserVO;
    import flash.errors.SQLError;
    import mx.rpc.IResponder;
    import mx.rpc.events.FaultEvent;
    import mx.rpc.events.ResultEvent;
    import sql.FlexBlogDatabaseManager;


    public class RegisterUserDelegate
    {
        private var responder:IResponder;
        public function RegisterUserDelegate(responder:IResponder)
        {
            this.responder = responder;
        }
        public function register(user:UserVO):void{
            var dbManager:FlexBlogDatabaseManager = FlexBlogDatabaseManager.getInstance();
            try{
            var userAdded:int =  dbManager.registerUser(user);
            var event:ResultEvent = new ResultEvent(ResultEvent.RESULT,false,true,{added:userAdded})
            this.responder.result(event)
            }catch(error:SQLError){
                var faultEvent:FaultEvent = new FaultEvent(FaultEvent.FAULT);
                this.responder.fault(faultEvent);
            }
        }

    }
}