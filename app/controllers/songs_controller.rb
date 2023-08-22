class SongsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @songs = Song.all
    @songs = policy_scope(Song)
  end

  def new
  end

  def create
  end

end
