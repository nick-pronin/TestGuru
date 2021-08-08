class TestsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_test, only: %i[ show edit update destroy start]
  before_action :find_user, only: :start

  def index
    @tests = Test.all
  end

  def show; end

  def edit; end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to test_path(@test)
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to tests_path(@test)
    else
      render :edit
    end
  end

  def destroy
    @test.destroy

    redirect_to tests_path
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def find_user
    @user = User.first
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
