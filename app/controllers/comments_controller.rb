class CommentsController < ApplicationController
  before_action :set_commentable
  before_action :set_comment, only: %i[ show ]

  def index
    @comments = @commentable.comments
    @user = User.find_by(id: @comment.user_id)
  end

  def show
    @user = User.find_by(id: @comment.user_id)
  end

  def new
    @comment = @commentable.comments.create
  end

  def create
    @comment = @commentable.comments.create(comment_params)

      if @comment.save
        redirect_to @commentable, notice: "Comment was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
  end

  private
    def set_commentable
      resource, id = request.path.split('/')[1,2]
      @commentable = resource.singularize.classify.constantize.find(id)
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content, :user_id)
    end
end
