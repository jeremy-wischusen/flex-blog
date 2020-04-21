package com.FlexBlog.models
{
    import com.FlexBlog.valueobjects.PostVO;
    import com.FlexBlog.valueobjects.UserNotificationVO;
    import com.FlexBlog.valueobjects.UserVO;

    import mx.collections.ArrayCollection;

    [Bindable]
    public class FlexBlogModel
    {
        private static var instance:FlexBlogModel = null;
        public var registrationStatus:String;
        public var userNotification:UserNotificationVO;
        public var mainView:int;
        public var currentUser:UserVO;
        public var categories:ArrayCollection = new ArrayCollection();
        public var postSubmissionStatus:String;
        public var recentPosts:ArrayCollection = new ArrayCollection();
        public var currentPost:PostVO;
        public var commentSubmissionStatus:String;
        public var comments:ArrayCollection =new ArrayCollection();
        public var searchTitle:String;
        public var searchResults:ArrayCollection = new ArrayCollection();
        public function FlexBlogModel(se:SingletonEnforcer)
        {
        }
        public static function getInstance():FlexBlogModel{
            if (FlexBlogModel.instance == null){
                FlexBlogModel.instance = new FlexBlogModel(new SingletonEnforcer());
            }
            return FlexBlogModel.instance;
        }

    }
}
class SingletonEnforcer{};