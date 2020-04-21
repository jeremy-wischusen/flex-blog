package com.FlexBlog.commands
{
    import com.FlexBlog.events.ChangeMainViewEvent;
    import com.FlexBlog.models.FlexBlogModel;
    import com.adobe.cairngorm.commands.ICommand;
    import com.adobe.cairngorm.control.CairngormEvent;

    public class LogoutCommand implements ICommand
    {
        private var model:FlexBlogModel = FlexBlogModel.getInstance();
        public function execute(event:CairngormEvent):void
        {
            this.model.currentUser = null;
            new ChangeMainViewEvent(ChangeMainViewEvent.POSTS_VIEW).dispatch();
        }

    }
}