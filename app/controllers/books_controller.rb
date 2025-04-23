class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  def create
     
  end
  def index
  end

  def show
  end

  def edit
  end
 
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
 
end


  

