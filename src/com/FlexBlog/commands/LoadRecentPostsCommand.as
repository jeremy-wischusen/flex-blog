package com.FlexBlog.commands
{
    import com.FlexBlog.delegates.LoadRecentPostsDelegate;
    import com.FlexBlog.events.SetCurrentPostEvent;
    import com.FlexBlog.models.FlexBlogModel;
    import com.FlexBlog.valueobjects.PostVO;
    import com.adobe.cairngorm.commands.ICommand;
    import com.adobe.cairngorm.control.CairngormEvent;

    import mx.rpc.IResponder;
    import mx.rpc.events.ResultEvent;

    public class LoadRecentPostsCommand implements ICommand, IResponder
    {
        private var model:FlexBlogModel =FlexBlogModel.getInstance();
        public function execute(event:CairngormEvent):void
        {
            var delegate:LoadRecentPostsDelegate = new LoadRecentPostsDelegate(this);
            delegate.loadRecentPosts();
        }

        public function result(data:Object):void
        {
            var evt:ResultEvent =  data as ResultEvent;
            if (evt.result.posts){
                this.model.recentPosts.source = evt.result.posts;
                if(!this.model.currentPost){
                    new SetCurrentPostEvent(PostVO(this.model.recentPosts.getItemAt(0))).dispatch();
                }
            }
        }

        public function fault(info:Object):void
        {
        }

    }
}