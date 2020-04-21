package com.FlexBlog.commands
{
    import com.FlexBlog.delegates.LoadCategoriesDelegate;
    import com.FlexBlog.models.FlexBlogModel;
    import com.FlexBlog.valueobjects.UserNotificationVO;
    import com.adobe.cairngorm.commands.ICommand;
    import com.adobe.cairngorm.control.CairngormEvent;

    import mx.rpc.IResponder;
    import mx.rpc.events.ResultEvent;

    public class LoadCategoriesCommand implements ICommand, IResponder
    {
        private var model:FlexBlogModel = FlexBlogModel.getInstance();
        public function execute(event:CairngormEvent):void
        {
            var delegate:LoadCategoriesDelegate = new LoadCategoriesDelegate(this);
            delegate.loadCategories()
        }

        public function result(data:Object):void
        {
            var evt:ResultEvent = data as ResultEvent;
            var notification:UserNotificationVO = new UserNotificationVO();
            if (evt.result.categories){
                this.model.categories.source = evt.result.categories;
            }
        }

        public function fault(info:Object):void
        {
        }

    }
}