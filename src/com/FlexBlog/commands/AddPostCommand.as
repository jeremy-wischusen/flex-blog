package com.FlexBlog.commands
{
    import com.FlexBlog.delegates.AddPostDelegate;
    import com.FlexBlog.events.AddPostEvent;
    import com.FlexBlog.models.FlexBlogModel;
    import com.FlexBlog.valueobjects.UserNotificationVO;
    import com.adobe.cairngorm.commands.ICommand;
    import com.adobe.cairngorm.control.CairngormEvent;

    import mx.rpc.IResponder;
    import mx.rpc.events.ResultEvent;

    public class AddPostCommand implements ICommand, IResponder
    {
        private var model:FlexBlogModel =FlexBlogModel.getInstance();
        public function execute(event:CairngormEvent):void
        {
            this.model.postSubmissionStatus =''
            var evt:AddPostEvent = event as AddPostEvent
            var delegate:AddPostDelegate = new AddPostDelegate(this);
            delegate.addPost(evt.post);
        }

        public function result(data:Object):void
        {
            var evt:ResultEvent = data as ResultEvent;
            var notification:UserNotificationVO = new UserNotificationVO();
            if (evt.result.added == 1){
                this.model.postSubmissionStatus = 'success';
                notification.message = 'Post added';
            }else{
                this.model.postSubmissionStatus = 'failed';
                notification.type = UserNotificationVO.ERROR_MESSAGE;
                notification.message = 'Post could not be added';
            }
            this.model.userNotification = notification;
        }

        public function fault(info:Object):void
        {
            this.model.postSubmissionStatus = 'fault';
            var notification:UserNotificationVO = new UserNotificationVO();
            notification.type = UserNotificationVO.ERROR_MESSAGE;
            notification.message ='The server encountered an error while trying to add the post.'
            this.model.userNotification = notification;
        }

    }
}