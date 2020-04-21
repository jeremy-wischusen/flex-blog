package com.FlexBlog.events
{
    import com.FlexBlog.valueobjects.PostVO;
    import com.adobe.cairngorm.control.CairngormEvent;

    public class SetCurrentPostEvent extends CairngormEvent
    {
        public static const SET:String = 'setCurrentPostsEvent';
        public var post:PostVO;
        public function SetCurrentPostEvent(post:PostVO, bubbles:Boolean=false, cancelable:Boolean=false)
        {
            super(SET, bubbles, cancelable);
            this.post = post;
        }

    }
}