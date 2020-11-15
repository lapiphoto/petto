class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
  end

  def new
    @pet = Pet.find(params[:pet_id])
    @question = Question.new(question_params)
  end
  
  def create
    @pet = Pet.find(params[:pet_id])
    @question = Question.new(question_params)
		@question.pet_id = @pet.id
		@question.user_id = current_user.id
		if @question.save
  		redirect_to request.referer
		else
		  render 'questions/show'
		end
  end

  def edit
  end
  
  private
  def question_params
    params.require(:question).permit(:title, :body, :user_id, :pet_id)
  end
  
end
