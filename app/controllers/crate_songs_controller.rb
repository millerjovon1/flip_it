class CrateSongsController < ApplicationController
  def create
    @crate_song = CrateSong.new(crate_songs_params)
    authorize @crate_song
    if @crate_song.save
      redirect_to crate_path(@crate_song.crate)
    else
      render :new, status: :unprocessable_entity
    end
  end

    def destroy
      @crate_song = CrateSong.find(params[:id])
      @crate_song.destroy
      authorize @crate_song
      redirect_to crate_path(@crate_song.crate), status: :see_other
    end

  private

  def crate_songs_params
    params.require(:crate_song).permit(:song_id, :crate_id)
  end
end
