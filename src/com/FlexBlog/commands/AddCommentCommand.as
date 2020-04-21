package com.FlexBlog.commands
{
    import com.FlexBlog.delegates.AddCommentDelegate;
    import com.FlexBlog.events.AddCommentEvent;
    import com.FlexBlog.events.LoadCommentsEvent;
    import com.FlexBlog.models.FlexBlogModel;
    import com.FlexBlog.valueobjects.UserNotificationVO;
    import com.adobe.cairngorm.commands.ICommand;
    import com.adobe.cairngorm.control.CairngormEvent;

    import mx.rpc.IResponder;
    import mx.rpc.events.ResultEvent;

    public class AddCommentCommand implements ICommand, IResponder
    {
        private var model:FlexBlogModel =FlexBlogModel.getInstance();
        public function execute(event:CairngormEvent):void
        {
            this.model.commentSubmissionStatus =''
            var evt:AddCommentEvent = event as AddCommentEvent;
            var delegate:AddCommentDelegate = new AddCommentDelegate(this);
            delegate.addComment(evt.comment);
        }

        public function result(data:Object):void
        {
            var evt:ResultEvent = data as ResultEvent;
            if (evt.result.added == 1){
                this.model.commentSubmissionStatus ='success'
                new LoadCommentsEvent(this.model.currentPost).dispatch();
            }
        }

        public function fault(info:Object):void
        {
            this.model.commentSubmissionStatus ='fault'
            var notification:UserNotificationVO =new UserNotificationVO();
            notification.type =UserNotificationVO.ERROR_MESSAGE;
            notification.message='There was a server error while trying to add your comment.';
            this.model.userNotification =notification;
        }

    }
}