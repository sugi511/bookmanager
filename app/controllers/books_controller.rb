class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
  end

  def edit
  end

  def new
  end
end
