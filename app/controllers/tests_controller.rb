class TestsController < ApplicationController
  add_breadcrumb 'Tests', :tests_url

  def index
    @tests = Test.order(created_at: :desc).paginate(:page => params[:page], :per_page => 5)
  end

  def show
    @test = Test.find(params[:id])

    @questions = @test.questions.order(created_at: :desc).paginate(:page => params[:page], :per_page => 5)
    add_breadcrumb @test.name, :test_url
  end

  def new
    add_breadcrumb 'Create new test', :new_test_url
    @test = Test.new
  end

  def create
    @test = Test.create(test_params)
    if @test.save
      flash[:success] = 'Test has been created successfully'
      redirect_to tests_url
    else
      render 'new'
    end
  end

  def edit
    @test = Test.find(params[:id])
    add_breadcrumb @test.name, :test_url
    add_breadcrumb 'Edit', :edit_test_url
  end

  def update
    @test = Test.find(params[:id])

    if @test.update(test_params)
      redirect_to tests_url
      flash[:success] = 'Test has been successfully updated'
    else
      flash[:danger] = 'Error!'
      render 'edit'
    end
  end

  def destroy
    @test = Test.find(params[:id])

    @test.destroy
    flash[:success] = 'Test has been successfully deleted'
    redirect_to tests_url
  end

  private

  def test_params
    params.require(:test).permit(:name, :description)
  end
end
