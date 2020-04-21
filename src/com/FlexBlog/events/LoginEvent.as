package com.FlexBlog.events
{
    import com.FlexBlog.valueobjects.UserVO;
    import com.adobe.cairngorm.control.CairngormEvent;

    public class LoginEvent extends CairngormEvent
    {
        public static const LOGIN:String = "loginEvent";
        public var user:UserVO;
        public function LoginEvent(user:UserVO, bubbles:Boolean=false, cancelable:Boolean=false)
        {
            super(LOGIN, bubbles, cancelable);
            this.user =user;
        }

    }
}