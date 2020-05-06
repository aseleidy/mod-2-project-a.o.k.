class CommentsController < ApplicationController 
    
    def new
        @comment = Comment.new
    end
    
    def index
        @comments = Comment.all 
    end

    def edit 
        set_comment
    end

    def update 
        set_comment
        @comment.update(comment_params)
        redirect_to @comment
    end

    def show
        set_comment
    end

    def delete 
        set_comment
        @comment.destroy 
        # redirect_to @place

    end

    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        @comment.place_id = 1
        #I put 1 as the placeholder, since there needs to be an instance of a place in order for a comment to post, otherwise it won't validate.
        #Once this is nested, Jess said there's a way to pull it from the URL. 
        #here is the line I pulled from Kyle's controller:
        #@itinerary = Itinerary.find(itinerary_params[:identify])

        @comment.save
        redirect_to @comment
    end 

    private

    def set_comment
        @comment = Comment.find(params[:id])
    end
#############################################
    # def place_params
    #     params.require(:place).permit(:identify)
    # end 
##############################################
#I have *no idea* how the above works but it looks like it was kyle's code for figuring out the itinerary parameter, so I adapted it and am testing it for comments.
    def comment_params
        params.require(:comment).permit(:content)
    end 

end
