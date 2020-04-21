package com.FlexBlog.events
{
    import com.FlexBlog.valueobjects.CategoryVO;
    import com.adobe.cairngorm.control.CairngormEvent;

    public class CategorySearchEvent extends CairngormEvent
    {
        public static const CATEGORY_SEARCH:String = 'categorySearchEvent';
        public var category:CategoryVO;
        public function CategorySearchEvent(category:CategoryVO, bubbles:Boolean=false, cancelable:Boolean=false)
        {
            super(CATEGORY_SEARCH, bubbles, cancelable);
            this.category = category;
        }

    }
}