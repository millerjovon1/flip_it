class SongsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @songs = Song.all
    @songs = policy_scope(Song)
  end

  def new
    @song = Song.new
    authorize @song
  end

  def show
    @song = Song.find(params[:id])
    authorize @song
  end

  def create
    @song = Song.new(song_params)
    @song.user = current_user
    authorize @song
    if @song.save
      redirect_to song_path(@song)
    else
      render "song/new", status: :unprocessable_entity
    end
  end


private

def song_params
    params.require(:song).permit(:title, :genre, :bpm, :instruments, :audio_file)
  end
end
