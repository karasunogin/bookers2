class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end
  
  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(@user.params)
    if @user.save
      redirect_to user_path(user.id)
    else
      render :update
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :profile_image, :body)
  end
end