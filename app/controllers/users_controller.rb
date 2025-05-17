class UsersController < ApplicationController
  
  def index
    @users = User.all
     @book = Book.new
  end

  def show
    @user = User.find(params[:id]) 
    @profile_image = @user.profile_image   
    @book = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id]) 
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id]) 
    if @user.update(user_params)
      flash[:notice] = "Profile was successfully updated."
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private
  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end

end
