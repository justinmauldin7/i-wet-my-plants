class GardensController < ApplicationController
  def new
    @garden = Garden.new
  end

  def create
    @garden = Garden.new(name: garden_params[:name],
                            twitter_handle: garden_params[:twitter_handle],
                            zip_code: garden_params[:zip_code],
                            user_id: current_user.id)

    if @garden.save
      redirect_to plants_path
      flash[:success] = "Your garden has been created."
    else
      @errors = @plant.errors
      render :new
    end
  end

  private

  def garden_params
    params.require(:garden).permit(:name, :twitter_handle, :zip_code)
  end
end