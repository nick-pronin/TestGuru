class TestsController < ApplicationController
  before_action :authenticate_user!, only: :start
  before_action :find_test, only: :start

  def index
    @tests = Test.all

    if current_user.try(:admin?)
      redirect_to admin_tests_path
    end
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
