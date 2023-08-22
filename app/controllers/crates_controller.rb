class CratesController < ApplicationController

  def index
    @crates = Crate.all
  end

  def show
    @crate = Crate.find(params[:id])
    authorize @crate
  end

  def new
    @crate = Crate.new(crate_params)
  end

  def create
    # A song ID can be passed in the body of the POST request
    # This song ID can be used to create a CrateSong,
    # associated to the newly created crate
    @crate = Crate.new(crate_params)
    @crate.user = current_user
      if @crate.save
        redirect_to crates_path
      end
  end

  private

  def crate_params
    params.require(:crate).permit(:name)
  end


end
