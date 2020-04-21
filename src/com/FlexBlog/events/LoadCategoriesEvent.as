package com.FlexBlog.events
{
    import com.adobe.cairngorm.control.CairngormEvent;

    public class LoadCategoriesEvent extends CairngormEvent
    {
        public static const LOAD:String = 'loadCategoriesEvent';
        public function LoadCategoriesEvent(bubbles:Boolean=false, cancelable:Boolean=false)
        {
            super(LOAD, bubbles, cancelable);
        }

    }
}