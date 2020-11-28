class QuestionsController < ApplicationController
  before_action :authenticate_user!
  def show
    @pet = Pet.find(params[:pet_id])
    @question = Question.find(params[:id])
  end

  def new
    @pet = Pet.find(params[:pet_id])
    @question = Question.new
  end

  def create
    @pet = Pet.find(params[:pet_id])
    @question = Question.new(question_params)
		@question.pet_id = @pet.id
		@question.user_id = @pet.user.id
		if @question.save
  		redirect_to pet_path(@pet)
		else
		  render 'questions/show'
		end
  end

  def edit
    @pet = Pet.find(params[:pet_id])
    @question = Question.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:pet_id])
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to pet_path(@pet)
    else
      render "edit"
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :body)
  end

end
