package com.FlexBlog.commands
{
    import com.FlexBlog.delegates.RegisterUserDelegate;
    import com.FlexBlog.events.RegisterUserEvent;
    import com.FlexBlog.models.FlexBlogModel;
    import com.FlexBlog.valueobjects.UserNotificationVO;
    import com.adobe.cairngorm.commands.ICommand;
    import com.adobe.cairngorm.control.CairngormEvent;

    import mx.rpc.IResponder;
    import mx.rpc.events.ResultEvent;

    public class RegisterUserCommand implements ICommand, IResponder
    {
        private var model:FlexBlogModel = FlexBlogModel.getInstance();
        public function execute(event:CairngormEvent):void
        {
            this.model.registrationStatus = '';
            var evt:RegisterUserEvent = event as RegisterUserEvent;
            var delegate:RegisterUserDelegate = new RegisterUserDelegate(this);
            delegate.register(evt.user);
        }

        public function result(data:Object):void
        {
            var event:ResultEvent = data as ResultEvent;
            var notification:UserNotificationVO = new UserNotificationVO();
            if (event.result.added ==1){
                this.model.registrationStatus = 'success';
                notification.message = 'Your account has been created.'

            }else if(event.result.added ==-1){
                this.model.registrationStatus = 'failed';
                notification.type = UserNotificationVO.ERROR_MESSAGE;
                notification.message = 'An account with that user name and password already exists.'
            }else{
                notification.type = UserNotificationVO.ERROR_MESSAGE;
                notification.message = 'Account could not be created at this time. Please try again later.'

            }
                this.model.userNotification = notification;
        }

        public function fault(info:Object):void
        {
                this.model.registrationStatus = 'fault';
                var notification:UserNotificationVO = new UserNotificationVO();
                notification.message = 'There was an error processing your registration, please try again.'
                notification.type = UserNotificationVO.ERROR_MESSAGE;
                this.model.userNotification = notification;
        }

    }
}