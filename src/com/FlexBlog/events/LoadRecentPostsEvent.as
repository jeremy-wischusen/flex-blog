package com.FlexBlog.events
{
    import com.adobe.cairngorm.control.CairngormEvent;

    public class LoadRecentPostsEvent extends CairngormEvent
    {
        public static const LOAD:String = 'loadRecentPostsEvent';
        public function LoadRecentPostsEvent(bubbles:Boolean=false, cancelable:Boolean=false)
        {
            super(LOAD, bubbles, cancelable);
        }

    }
}