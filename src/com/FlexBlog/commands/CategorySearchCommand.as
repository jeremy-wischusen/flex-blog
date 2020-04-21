package com.FlexBlog.commands
{
    import com.FlexBlog.delegates.CategorySearchDelegate;
    import com.FlexBlog.events.CategorySearchEvent;
    import com.FlexBlog.models.FlexBlogModel;
    import com.FlexBlog.valueobjects.CategoryVO;
    import com.FlexBlog.valueobjects.UserNotificationVO;
    import com.adobe.cairngorm.commands.ICommand;
    import com.adobe.cairngorm.control.CairngormEvent;

    import mx.rpc.IResponder;
    import mx.rpc.events.ResultEvent;

    public class CategorySearchCommand implements ICommand, IResponder
    {
        private var model:FlexBlogModel = FlexBlogModel.getInstance();
        private var category:CategoryVO
        public function execute(event:CairngormEvent):void
        {
            var evt:CategorySearchEvent =  event as CategorySearchEvent;
            this.category = evt.category;
            var delegate:CategorySearchDelegate = new CategorySearchDelegate(this);
            delegate.search(this.category);
        }

        public function result(data:Object):void
        {
            var evt:ResultEvent =  data as ResultEvent;
            if (evt.result.posts){
                this.model.searchResults.source = evt.result.posts;
                this.model.searchTitle = "Search results for category " + this.category.name + ".";
            }else{
                var notification:UserNotificationVO =new UserNotificationVO();
                notification.message = "No results found for category " + this.category.name + ".";
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