class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @crates = Crate.all
    authorize @user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :artist_name, :email, :profile_photo)
  end
end
