package com.FlexBlog.commands
{
    import com.FlexBlog.models.FlexBlogModel;
    import com.adobe.cairngorm.commands.ICommand;
    import com.adobe.cairngorm.control.CairngormEvent;

    public class ClearSearchResultsCommand implements ICommand
    {
        private var model:FlexBlogModel = FlexBlogModel.getInstance();
        public function execute(event:CairngormEvent):void
        {
            this.model.searchResults.removeAll();
            this.model.searchTitle = '';
        }

    }
}