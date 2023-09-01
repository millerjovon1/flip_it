class SongsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @songs = policy_scope(Song).order(created_at: :desc)
    @originals = @songs.originals
    @remixes = @songs.remixes
    @crate_song = CrateSong.new
    @crates = Crate.all
  end

  def new
    @song = Song.new
    @songs = Song.all
    authorize @song
  end

  def show
    @song = Song.find(params[:id])
    @crate_song = CrateSong.new
    authorize @song
  end

  def create
    @song = Song.new(song_params)
    @song.user = current_user
    authorize @song

    if @song.save
      unless params[:base_id] == ''
        source = Source.new
        source.remix = @song
        source.base = Song.find(params[:base_id])
        source.save
      end
      redirect_to songs_path
    else
      @songs = Song.all.order(created_at: :desc)
      render "songs/new", status: :unprocessable_entity
    end
  end


  private

  def song_params
    params[:song][:instruments] = (params[:song][:instruments] - [""]).join(", ")
    params.require(:song).permit(:title, :genre, :bpm, :instruments, :audio_file, :photo)
  end
end
