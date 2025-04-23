class UsersController < ApplicationController
  def new
     
  end

  def show
    @user = User.find(params[:id]) 
    @profile_image = @user.profile_image   
  end

  def edit
  end

  private
  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end

end
