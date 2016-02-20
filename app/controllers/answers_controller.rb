class AnswersController < ApplicationController
  def create
    @test = Test.find(params[:test_id])
    @question = @test.questions.find(params[:question_id])
    @answer = @question.answers.create(answer_params)

    if @answer.save
      flash[:success] = 'Answer has been added successfully'
      redirect_to test_question_url(@question)
    else
      render 'new'
    end
  end

  private

   def answer_params
     params.require(:answer).permit(:content, :status, :question_id, :test_id)
   end
end
