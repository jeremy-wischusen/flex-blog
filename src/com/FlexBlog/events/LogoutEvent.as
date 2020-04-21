package com.FlexBlog.events
{
    import com.adobe.cairngorm.control.CairngormEvent;

    public class LogoutEvent extends CairngormEvent
    {
        public static const LOGOUT:String = 'logoutEvent';
        public function LogoutEvent(bubbles:Boolean=false, cancelable:Boolean=false)
        {
            super(LOGOUT, bubbles, cancelable);
        }

    }
}