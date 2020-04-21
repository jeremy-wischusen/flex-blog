package com.FlexBlog.commands
{
    import com.FlexBlog.delegates.LoginDelegate;
    import com.FlexBlog.events.LoginEvent;
    import com.FlexBlog.models.FlexBlogModel;
    import com.FlexBlog.valueobjects.UserNotificationVO;
    import com.adobe.cairngorm.commands.ICommand;
    import com.adobe.cairngorm.control.CairngormEvent;

    import mx.rpc.IResponder;
    import mx.rpc.events.ResultEvent;

    public class LoginCommand implements ICommand, IResponder
    {
        private var model:FlexBlogModel = FlexBlogModel.getInstance();
        public function execute(event:CairngormEvent):void
        {
            var evt:LoginEvent = event as LoginEvent;
            var delegate:LoginDelegate = new LoginDelegate(this);
            delegate.login(evt.user);
        }

        public function result(data:Object):void
        {
            var evt:ResultEvent = data as ResultEvent;
            var notification:UserNotificationVO = new UserNotificationVO();
            if(evt.result.user){
                this.model.currentUser = evt.result.user;
            }else{
                notification.type = UserNotificationVO.ERROR_MESSAGE;
                notification.message = 'No account with that user name and password could be found';
                this.model.userNotification =notification;
            }
        }

        public function fault(info:Object):void
        {
            var notification:UserNotificationVO = new UserNotificationVO();
            notification.type = UserNotificationVO.ERROR_MESSAGE;
            notification.message = 'A server error occured while tyring to log you in. Please try again later';
            this.model.userNotification =notification;
        }

    }
}