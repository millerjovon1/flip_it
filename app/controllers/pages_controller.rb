class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @songs = policy_scope(Song).order(created_at: :desc)
    @originals = @songs.originals
    @remixes = @songs.remixes
    @crate_song = CrateSong.new
  end

  def search
    @songs = policy_scope(Song).order(created_at: :desc)
    @crate_song = CrateSong.new

    @songs = @songs.where(genre: params[:genre]) if params[:genre].present?
    @songs = @songs.where(instruments: params[:instruments]) if params[:instruments].present?
    PgSearch::Multisearch.rebuild(User)
    results = PgSearch.multisearch(params[:query])
    @sorted_results = results.map(&:searchable).group_by { |result| result.class }

  end
end
