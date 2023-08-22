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

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user

    authorize @restaurant
    if @restaurant.save
      respond_to do |format|
        format.html { redirect_to restaurants_path }
        format.json { render json: {
          item_html: render_to_string(partial: 'restaurants/card', formats: :html, locals: { restaurant: @restaurant }),
          form_html: render_to_string(partial: 'restaurants/form', formats: :html, locals: { restaurant: Restaurant.new })
        } }
      end
    else
      respond_to do |format|
        format.html {render :new, status: :unprocessable_entity }
        format.json { render json: {
          form_html: render_to_string(partial: 'restaurants/form', formats: :html, locals: { restaurant: @restaurant })
        } }
      end
    end
  end


end
