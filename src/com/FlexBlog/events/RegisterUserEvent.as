package com.FlexBlog.events
{
    import com.FlexBlog.valueobjects.UserVO;
    import com.adobe.cairngorm.control.CairngormEvent;

    public class RegisterUserEvent extends CairngormEvent
    {
        public static const REGISTER_USER:String = 'registerUser';
        public var user:UserVO;
        public function RegisterUserEvent(user:UserVO, bubbles:Boolean=false, cancelable:Boolean=false)
        {
            super(REGISTER_USER, bubbles, cancelable);
            this.user = user;
        }

    }
}