package com.FlexBlog.events
{
    import com.adobe.cairngorm.control.CairngormEvent;

    public class KeyWordSearchEvent extends CairngormEvent
    {
        public static const KEYWORD_SEARCH:String = 'keyWordSearchEvent';
        public var keyWords:String;
        public function KeyWordSearchEvent(keyWords:String, bubbles:Boolean=false, cancelable:Boolean=false)
        {
            super(KEYWORD_SEARCH, bubbles, cancelable);
            this.keyWords = keyWords;
        }

    }
}