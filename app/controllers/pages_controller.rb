class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def search
    results = PgSearch.multisearch(params[:query])
    @sorted_results = results.map(&:searchable).group_by { |result| result.class }
  end

end
