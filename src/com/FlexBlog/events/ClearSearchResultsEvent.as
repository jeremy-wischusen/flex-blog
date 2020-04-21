package com.FlexBlog.events
{
    import com.adobe.cairngorm.control.CairngormEvent;

    public class ClearSearchResultsEvent extends CairngormEvent
    {
        public static const CLEAR_RESULTS:String = "clearSearchResultsEvent";
        public function ClearSearchResultsEvent(bubbles:Boolean=false, cancelable:Boolean=false)
        {
            super(CLEAR_RESULTS, bubbles, cancelable);
        }

    }
}