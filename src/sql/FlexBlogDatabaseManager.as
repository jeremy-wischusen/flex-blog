package sql
{
    import com.FlexBlog.valueobjects.CategoryVO;
    import com.FlexBlog.valueobjects.CommentVO;
    import com.FlexBlog.valueobjects.PostVO;
    import com.FlexBlog.valueobjects.UserVO;

    import flash.data.SQLResult;
    import flash.filesystem.File;

    public class FlexBlogDatabaseManager extends SQLiteManager
    {
        private static var instance:FlexBlogDatabaseManager = null;
        public function FlexBlogDatabaseManager(se:SingletonEnforcer)
        {
            super(File.applicationDirectory.resolvePath('FlexBlog.db'));
        }
        public function registerUser(user:UserVO):int{
            var userExists:SQLResult = this.query("SELECT * FROM users WHERE userName = '"+ user.userName + "' AND password = '" +user.password+ "'");
            if (userExists.data){
                return -1;
            }
            var userAdded :SQLResult = this.query('INSERT INTO users (firstName,lastName,userName,password) VALUES("'+user.firstName+'","'+user.lastName+'", "'+user.userName+'", "'+user.password+'");');

            return userAdded.rowsAffected;
        }
        public function login(user:UserVO):UserVO{
            this.statement.itemClass =UserVO;
            var userData:SQLResult= this.query("SELECT * FROM users WHERE userName = '"+ user.userName + "' AND password = '" +user.password+ "'");
            if(userData.data && userData.data.length == 1){
                return userData.data[0];
            }
            return null;
        }
        public function addPost(post:PostVO):int{
            var query:String = "INSERT INTO posts (authorId, categoryId, title, body) VALUES(:auhtorId, :catgeoryId, :title, :body);"
            this.statement.parameters[":auhtorId"] = post.authorId;
            this.statement.parameters[":catgeoryId"] = post.categoryId;
            this.statement.parameters[":title"] = post.title;
            this.statement.parameters[":body"] = post.body;
            return this.query(query).rowsAffected;
        }
        public function getCategories():Array{
            this.statement.itemClass = CategoryVO;
            return this.query("SELECT * FROM categories;").data;
        }
        public function getRecentPosts():Array{
            this.statement.itemClass = PostVO;
            return this.query("SELECT * FROM posts_view ORDER BY createdOn DESC;").data;
        }
        public function getComments(post:PostVO):Array{
            this.statement.itemClass = CommentVO;
            var query:String = 'SELECT c . * , u . firstName ||" "|| u . lastName AS postedBy FROM comments c JOIN users u USING ( userID ) WHERE postId = @id;';
            this.statement.parameters["@id"] = post.postId;
            return this.query(query).data;
        }
        public function addComment(comment:CommentVO):int{
            var query:String = "INSERT INTO comments (postId, userId, body) VALUES (:postId, :userId, :body)";
            this.statement.parameters[":postId"] = comment.postId;
            this.statement.parameters[":userId"] = comment.userId;
            this.statement.parameters[":body"] = comment.body;
            return this.query(query).rowsAffected;

        }
        public function getPostsByCategory(category:CategoryVO):Array{
            this.statement.itemClass =PostVO;
            return this.query("SELECT * FROM posts_view WHERE categoryId ="+category.categoryId+";").data;
        }
        public function keyWordSearch(keyWords:String):Array{
            this.statement.itemClass =PostVO;
            var terms:Array =keyWords.split(' ');
            var likeClause:String ='';
            for (var i:int = 0; i<terms.length; i++){
                if(i > 0){
                    likeClause += "OR";
                }
                likeClause += " title LIKE '%"+terms[i]+"%' OR body LIKE '%"+terms[i]+"%' ";
            }
            if(likeClause.length > 0){
                var query:String = "SELECT * FROM posts_view WHERE " + likeClause +";";
                return this.query(query).data;
            }
            return null;
        }
        public static function getInstance():FlexBlogDatabaseManager{
            if (FlexBlogDatabaseManager.instance == null){
                FlexBlogDatabaseManager.instance = new FlexBlogDatabaseManager(new SingletonEnforcer());
            }
            return FlexBlogDatabaseManager.instance;
        }

    }
}
class SingletonEnforcer{};
