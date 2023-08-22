class CrateSongsController < ApplicationController
  def create
    @song = Song.find(params[:song_id])
    @crate_song = CrateSong.new(crate_songs_params)
    @crate_song.song = @song
    if @crate_song.save
      redirect_to user_crate_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def crate_songs_params
    params.require(:crate, :crate_id)
  end
end
