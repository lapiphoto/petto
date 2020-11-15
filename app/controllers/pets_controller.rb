class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def show
     @pet = Pet.find(params[:id])
     @post_comment = PostComment.new
  end

  def new
    @pet = Pet.new
  end

  def create
    pet = Pet.new(pet_params)
    pet.save
    redirect_to pets_path
  end

  def edit
     @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update(pet_params)
    redirect_to pet_path(pet)
  end

  private
  def pet_params
    params.require(:pet).permit(:title, :comment, :purchase_cost, :initial_cost, :place, :cost, :lifespan, :trait, :reason, :care, :food, :attention, :blog, :image)
  end

end

