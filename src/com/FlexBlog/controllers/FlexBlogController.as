package com.FlexBlog.controllers
{
  import com.FlexBlog.commands.*;
  import com.FlexBlog.events.*;
  import com.adobe.cairngorm.control.FrontController;

  public class FlexBlogController extends FrontController
  {
    public function FlexBlogController()
    {
      super();
      addCommand(ChangeMainViewEvent.CHANGE_MAIN_VIEW, ChangeMainViewCommand);
      addCommand(RegisterUserEvent.REGISTER_USER, RegisterUserCommand);
      addCommand(LoginEvent.LOGIN,LoginCommand);
      addCommand(LogoutEvent.LOGOUT,LogoutCommand);
      addCommand(LoadCategoriesEvent.LOAD, LoadCategoriesCommand);
      addCommand(AddPostEvent.ADD_POST,AddPostCommand);
      addCommand(ApplicationInitializeEvent.INIT,ApplicationInitializeCommand);
      addCommand(LoadRecentPostsEvent.LOAD, LoadRecentPostsCommand);
      addCommand(SetCurrentPostEvent.SET,SetCurrentPostCommand);
      addCommand(LoadCommentsEvent.LOAD,LoadCommentsCommand);
      addCommand(AddCommentEvent.ADD,AddCommentCommand);
      addCommand(KeyWordSearchEvent.KEYWORD_SEARCH, KeyWordSearchCommand)
      addCommand(CategorySearchEvent.CATEGORY_SEARCH, CategorySearchCommand);
      addCommand(ClearSearchResultsEvent.CLEAR_RESULTS, ClearSearchResultsCommand);
    }

  }
}