class SongsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @songs = policy_scope(Song).order(created_at: :desc)
    @crate_song = CrateSong.new


  end

  def new
    @song = Song.new
    @songs = Song.all
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
      Source.create(base_id: params[:base_id], remix: @song) if params[:base_id].present?
      redirect_to songs_path
    else
      render "song/new", status: :unprocessable_entity
    end
  end


private

def song_params
    params.require(:song).permit(:title, :genre, :bpm, :instruments, :audio_file, :photo)
  end
end
