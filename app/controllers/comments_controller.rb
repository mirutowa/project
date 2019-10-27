class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
  end
  
  def create
    
    @comment = current_user.comments.new(comment_params)
    @comment.topic_id = params[:topic_id]

    if @comment.save
      redirect_to topics_path, success: 'コメントしました'
    else
      flash.now[:danger] = "コメント出来ませんでした"
      render :new
    end  
  end
  
  
  private
  def comment_params
    params.require(:comment).permit(:content)
  end    
      
end
