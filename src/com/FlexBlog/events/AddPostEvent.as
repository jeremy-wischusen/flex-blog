package com.FlexBlog.events
{
    import com.FlexBlog.valueobjects.PostVO;
    import com.adobe.cairngorm.control.CairngormEvent;

    public class AddPostEvent extends CairngormEvent
    {
        public static const ADD_POST:String = 'addPostsevent'
        public var post:PostVO;
        public function AddPostEvent(post:PostVO, bubbles:Boolean=false, cancelable:Boolean=false)
        {
            super(ADD_POST, bubbles, cancelable);
            this.post = post;
        }

    }
}