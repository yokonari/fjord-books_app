# frozen_string_literal: true

module Commentable
  extend ActiveSupport::Concern

  included do
    before_action :set_commentable
  end

  def create
    @comment = @commentable.comments.new(comment_params)

    if @comment.save
      redirect_to @commentable, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      redirect_to @commentable
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user: current_user)
  end

  def set_commentable
    raise NotImplementedError
  end
end
