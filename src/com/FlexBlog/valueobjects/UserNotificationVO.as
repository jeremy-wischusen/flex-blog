package com.FlexBlog.valueobjects
{
    [Bindable]
    public class UserNotificationVO
    {
        public static const ERROR_MESSAGE:String = 'errorMessage';
        public static const SUCCESS_MESSAGE:String = 'successMessage';
        public var message:String = '';
        public var type:String = '';
    }
}