class FavoritesController < ApplicationController
  before_action :authenticate_user!
  def create
    @pet = Pet.find(params[:pet_id])
    @favorite = @pet.favorites.new(user_id: current_user.id)
    @favorite.save
  end

  def destroy
    @pet = Pet.find(params[:pet_id])
    favorite = @pet.favorites.find_by(user_id: current_user.id)
    favorite.destroy
  end
end
