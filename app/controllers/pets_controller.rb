class PetsController < ApplicationController

  def index
    @searchpets = Pet.all
  end

  def show
     @pet = Pet.find(params[:id])
     @user = @pet.user
     @new_post_comment = PostComment.new
     #@post_comment = PostComment.find(params[:id])
     if user_signed_in?
     @favorite = Favorite.find_by(pet_id: @pet.id, user_id: current_user.id)
    end
     @reply = Reply.new
     @questions = Question.where(pet_id: @pet.id)
     #byebug
  end

  def new
    @pet = Pet.new
  end

  def create
    pet = Pet.new(pet_params)
    pet.user_id = current_user.id
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
    params.require(:pet).permit(:title, :comment, :purchase_cost, :initial_cost, :place, :cost, :lifespan, :length, :weight, :care, :food, :attention,:category_id, :personality, :image,  :tag_list, :user_id)
  end

end

