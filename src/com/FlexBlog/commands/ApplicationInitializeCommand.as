package com.FlexBlog.commands
{
    import com.FlexBlog.events.LoadCategoriesEvent;
    import com.FlexBlog.events.LoadRecentPostsEvent;
    import com.adobe.cairngorm.commands.ICommand;
    import com.adobe.cairngorm.control.CairngormEvent;

    public class ApplicationInitializeCommand implements ICommand
    {
        public function execute(event:CairngormEvent):void
        {
            new LoadCategoriesEvent().dispatch();
            new LoadRecentPostsEvent().dispatch();
        }

    }
}