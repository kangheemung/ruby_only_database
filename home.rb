require_relative 'post'
class Home
    
    def index
      @posts=Post.all
    end
 
end
 Home.new.index
 