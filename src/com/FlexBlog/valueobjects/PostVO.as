package com.FlexBlog.valueobjects
{
    [Bindable]
    public class PostVO
    {
        public var postId:int;
        public var authorId:int;
        public var categoryId:int;
        public var title:String;
        public var body:String;
        public var createdOn:String;
        public var authorName:String;
        public var categoryName:String;
    }
}