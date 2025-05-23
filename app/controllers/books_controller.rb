class BooksController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  def new
    @book = Book.new
  end
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book)
    else
      @books = Book.all
      render :index
  end
  
end
  def index
    @books = Book.all
    @book = Book.new
    

  end

  def show
    @book = Book.find(params[:id]) 
    @user = @book.user
    @profile_image = @user.profile_image   
    @book_new = Book.new
  end

  def edit
    @book = Book.find(params[:id]) 
    @user = @book.user
    @profile_image = @user.profile_image   
  
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
     
    book = Book.find(params[:id]) 
    book.destroy  
    flash[:notice] = "Book was successfully destroyed."
    redirect_to '/books' 
  end
  private

  def ensure_correct_user
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
    end
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
 
end



