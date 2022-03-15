class CommentsController < ApplicationController
  before_action :set_commentable

  def index
  end

  def new
    @comment = @commentable.comments.create
  end

  def create
    @comment = @commentable.comments.create(comment_params)

    @comment.save
    redirect_to @commentable, notice: "Comment was successfully created."
  end

  private
    def set_commentable
      resource, id = request.path.split('/')[1,2]
      @commentable = resource.singularize.classify.constantize.find(id)
    end

    def comment_params
      params.require(:comment).permit(:content).merge(user_id: current_user.id)
    end
end
