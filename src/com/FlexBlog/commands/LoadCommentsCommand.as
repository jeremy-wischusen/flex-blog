package com.FlexBlog.commands
{
    import com.FlexBlog.delegates.LoadCommentsDelegate;
    import com.FlexBlog.events.LoadCommentsEvent;
    import com.FlexBlog.models.FlexBlogModel;
    import com.adobe.cairngorm.commands.ICommand;
    import com.adobe.cairngorm.control.CairngormEvent;

    import mx.rpc.IResponder;
    import mx.rpc.events.ResultEvent;

    public class LoadCommentsCommand implements ICommand, IResponder
    {
        private var model:FlexBlogModel = FlexBlogModel.getInstance();
        public function execute(event:CairngormEvent):void
        {
            var evt:LoadCommentsEvent = event as LoadCommentsEvent;
            var delegate:LoadCommentsDelegate = new LoadCommentsDelegate(this);
            delegate.loadComments(evt.post);
        }

        public function result(data:Object):void
        {
            var evt:ResultEvent = data as ResultEvent;
            this.model.comments.source = evt.result.comments;
        }

        public function fault(info:Object):void
        {
        }

    }
}