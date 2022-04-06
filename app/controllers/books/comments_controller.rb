# frozen_string_literal: true

class Books::CommentsController < ApplicationController
  include Commentable

  private

  def set_commentable
    @commentable = Book.find(params[:book_id])
  end
end
