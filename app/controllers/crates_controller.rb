class CratesController < ApplicationController

  def show
    @crate = Crate.find(params[:id])
    authorize @crate
  end

  def new
    @crate = Crate.new
    authorize @crate
  end

  def create
    # A song ID can be passed in the body of the POST request
    # This song ID can be used to create a CrateSong,
    # associated to the newly created crate
    @crate = Crate.new(crate_params)
    @crate.user = current_user
    authorize @crate
      if @crate.save
        redirect_to user_path(current_user)
      end
  end

  private

  def crate_params
    params.require(:crate).permit(:name, :photo)
  end


end
