class FavoritesController < ApplicationController
  def create
    @pet = Pet.find(params[:pet_id])
    favorite = @pet.favorites.new(user_id: current_user.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    @pet = Pet.find(params[:pet_id])
    favorite = @pet.favorites.find_by(user_id: current_user.id)
    favorite.destroy
    redirect_to request.referer
  end
end
