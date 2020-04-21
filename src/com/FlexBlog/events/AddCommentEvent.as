package com.FlexBlog.events
{
    import com.FlexBlog.valueobjects.CommentVO;
    import com.adobe.cairngorm.control.CairngormEvent;

    public class AddCommentEvent extends CairngormEvent
    {
        public static const ADD:String = 'addCommentEvent';
        public var comment:CommentVO;
        public function AddCommentEvent(comment:CommentVO, bubbles:Boolean=false, cancelable:Boolean=false)
        {
            super(ADD, bubbles, cancelable);
            this.comment =comment;
        }

    }
}