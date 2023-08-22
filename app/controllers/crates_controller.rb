class CratesController < ApplicationController

  def show
    @crate = Crate.find(params[:id])
    @crate_songs = Crate.song.all
  end


  def create
    @song = Song.find(params[:id])
    @crate = Crate.new(crate_params)
    @crate.song = @song
    if @crate.save
      redirect_to user_path
    end
  end


  def update
    @crate = Crate.find(params[:id])
    @crate.update(crate_params)
    redirect_to crates_path
  end


  private

  def crate_params
    params.require(:crate).permit(:name)
  end


end
