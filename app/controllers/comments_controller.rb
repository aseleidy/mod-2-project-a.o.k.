class CommentsController < ApplicationController 
    
    def new

       # @itinerary = Itinerary.find(params[:itinerary_id])
        @place = Place.find(params[:place_id])
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
        redirect_to @place
    end

    def show
        set_comment
    end

    def delete 
        set_comment
        # if current_user.id = @comment.user_id
            @comment.destroy
        # else
        #     flash[:alert] = "This is not yours to delete."
        redirect_to @place

    end

    def create
        @place = Place.find(params[:place_id])
        @comment = @place.comments.new(comment_params)
        @comment.user_id = current_user.id
        @comment.save
        redirect_to (@place)
    end 

    private

    def set_comment
        @comment = Comment.find(params[:id])
    end
#############################################
    def place_params
        params.require(:comment).permit(:place_id)
    end 
##############################################
#I have *no idea* how the above works but it looks like it was kyle's code for figuring out the itinerary parameter, so I adapted it and am testing it for comments.
    def comment_params
        params.require(:comment).permit(:content)
    end 

end




