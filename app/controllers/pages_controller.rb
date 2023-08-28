class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def search
    @songs = policy_scope(Song).order(created_at: :desc)
    results = PgSearch.multisearch(params[:query])
    @sorted_results = results.map(&:searchable).group_by { |result| result.class }
    @songs = @songs.where(genre: params[:genre]) if params[:genre].present?
    @songs = @songs.where(instruments: params[:instruments]) if params[:instruments].present?
  end
end
