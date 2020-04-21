package com.FlexBlog.events
{
    import com.adobe.cairngorm.control.CairngormEvent;

    public class ChangeMainViewEvent extends CairngormEvent
    {
        public static const CHANGE_MAIN_VIEW:String = 'changeMainView';
        public static const POSTS_VIEW:int = 0;
        public static const WRITE_VIEW:int = 1;
        public static const REGISTER_VIEW:int = 2;
        public var goTo:int;
        public function ChangeMainViewEvent(goTo:int, bubbles:Boolean=false, cancelable:Boolean=false)
        {
            super(CHANGE_MAIN_VIEW, bubbles, cancelable);
            this.goTo = goTo;
        }

    }
}