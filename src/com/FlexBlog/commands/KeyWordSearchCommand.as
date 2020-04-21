package com.FlexBlog.commands
{
    import com.FlexBlog.delegates.KeyWordSearchDelegate;
    import com.FlexBlog.events.KeyWordSearchEvent;
    import com.FlexBlog.models.FlexBlogModel;
    import com.FlexBlog.valueobjects.UserNotificationVO;
    import com.adobe.cairngorm.commands.ICommand;
    import com.adobe.cairngorm.control.CairngormEvent;

    import mx.rpc.IResponder;
    import mx.rpc.events.ResultEvent;

    public class KeyWordSearchCommand implements ICommand, IResponder
    {
        private var model:FlexBlogModel = FlexBlogModel.getInstance();
        private var keyWords:String;
        public function execute(event:CairngormEvent):void
        {
            this.model.searchTitle = "Searching ..."
            var evt:KeyWordSearchEvent = event as KeyWordSearchEvent;
            this.keyWords = evt.keyWords;
            var delegate:KeyWordSearchDelegate = new  KeyWordSearchDelegate(this);
            delegate.search(this.keyWords);
        }

        public function result(data:Object):void
        {
            var evt:ResultEvent =  data as ResultEvent;
            if (evt.result.posts){
                this.model.searchResults.source = evt.result.posts;
                this.model.searchTitle = "Search results for " + this.keyWords + ".";
            }else{
                var notification:UserNotificationVO =new UserNotificationVO();
                notification.message = "No results found for search " + this.keyWords + ".";
                this.model.userNotification = notification;
            }
        }

        public function fault(info:Object):void
        {
            var notification:UserNotificationVO = new UserNotificationVO();
            notification.type = UserNotificationVO.ERROR_MESSAGE;
            notification.message = "An error occured while performing your search.";
            this.model.userNotification =notification;
        }

    }
}