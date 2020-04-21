package com.FlexBlog.events
{
    import com.FlexBlog.valueobjects.PostVO;
    import com.adobe.cairngorm.control.CairngormEvent;

    public class LoadCommentsEvent extends CairngormEvent
    {
        public static const LOAD:String = 'loadCommentsEvent';
        public var post:PostVO
        public function LoadCommentsEvent(post:PostVO, bubbles:Boolean=false, cancelable:Boolean=false)
        {
            super(LOAD, bubbles, cancelable);
            this.post = post;
        }

    }
}