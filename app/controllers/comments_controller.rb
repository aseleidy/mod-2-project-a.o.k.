class CommentsController < ApplicationController 

    def new
        set_place
        @comment = Comment.new
    end
    
    def index
        set_user
        @comments = Comment.all 
    end

    def edit
        @comment = Comment.find(params[:place_id])
        @place = Place.find(params[:id])

    end

    def update
        set_comment
        set_place
        @comment.update(comment_params)
        redirect_to @place
    end

    def show
        set_comment
    end

    def destroy
        set_comment
        set_place
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
    def set_place
        @place = Place.find(params[:place_id])
    end

    def set_comment
        @comment = Comment.find(params[:id])
    end

    def place_params
        params.require(:comment).permit(:place_id)
    end 

    def set_user 
        @current_user = current_user
    end
    
    def comment_params
        params.require(:comment).permit(:content)
    end 

end




