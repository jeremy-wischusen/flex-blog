package com.FlexBlog.commands
{
    import com.FlexBlog.events.LoadCommentsEvent;
    import com.FlexBlog.events.SetCurrentPostEvent;
    import com.FlexBlog.models.FlexBlogModel;
    import com.adobe.cairngorm.commands.ICommand;
    import com.adobe.cairngorm.control.CairngormEvent;

    public class SetCurrentPostCommand implements ICommand
    {
        private var model:FlexBlogModel = FlexBlogModel.getInstance()
        public function execute(event:CairngormEvent):void
        {
            var evt:SetCurrentPostEvent = event as SetCurrentPostEvent;
            this.model.currentPost = evt.post;
            new LoadCommentsEvent(this.model.currentPost).dispatch();
        }

    }
}