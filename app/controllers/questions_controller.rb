class QuestionsController < ApplicationController
  add_breadcrumb 'Tests', :tests_url

  def show
    @test = Test.find(params[:test_id])
    @question = @test.questions.find(params[:id])
    @answers = @question.answers.order(created_at: :desc).paginate(:page => params[:page], :per_page => 5)
  end

  def create
    @test = Test.find(params[:test_id])
    @question = @test.questions.create(question_params)

    if @question.save
      flash[:success] = 'Question has been added successfully'
      redirect_to test_url(@test)
    else
      render 'new'
    end
  end

  def edit
    @test = Test.find(params[:test_id])
    @question = @test.questions.find(params[:id])
    add_breadcrumb @test.name, :test_url
    add_breadcrumb 'Edit question', :edit_test_question_url
  end

  def update
    @test = Test.find(params[:test_id])
    @question = @test.questions.find(params[:id])

    if @question.update(question_params)
      redirect_to test_url(@test)
      flash[:success] = 'Question has been successfully updated'
    else
      flash[:danger] = 'Error!'
      render 'edit'
    end
  end

  def destroy
    @test = Test.find(params[:test_id])
    @question = @test.questions.find(params[:id])

    @question.destroy
    flash[:success] = 'Question has been successfully deleted'
    redirect_to test_url(@test)
  end

  private

  def question_params
    params.require(:question).permit(:content, :test_id)
  end
end
