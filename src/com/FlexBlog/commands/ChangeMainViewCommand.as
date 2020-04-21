package com.FlexBlog.commands
{
    import com.FlexBlog.events.ChangeMainViewEvent;
    import com.FlexBlog.models.FlexBlogModel;
    import com.adobe.cairngorm.commands.ICommand;
    import com.adobe.cairngorm.control.CairngormEvent;

    public class ChangeMainViewCommand implements ICommand
    {
        private var model:FlexBlogModel = FlexBlogModel.getInstance();
        public function execute(event:CairngormEvent):void
        {
            var evt:ChangeMainViewEvent = event as ChangeMainViewEvent;
            this.model.mainView = evt.goTo;
        }

    }
}