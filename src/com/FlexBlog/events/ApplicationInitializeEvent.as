package com.FlexBlog.events
{
    import com.adobe.cairngorm.control.CairngormEvent;

    public class ApplicationInitializeEvent extends CairngormEvent
    {
        public static const INIT:String = 'applicationInitEvent';
        public function ApplicationInitializeEvent(bubbles:Boolean=false, cancelable:Boolean=false)
        {
            super(INIT, bubbles, cancelable);
        }

    }
}