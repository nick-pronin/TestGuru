class Admin::TestsController < Admin::BaseController
  before_action :set_tests, only: %i[index update_inline]
  before_action :find_test, only: %i[show edit update destroy update_inline]

  def index; end

  def show; end

  def edit; end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.authorship.new(test_params)

    if @test.save
      redirect_to admin_test_path(@test), notice: t('.notice')
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_tests_path, notice: t('.notice')
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path(@test), notice: t('.notice')
    else
      render :index
    end
  end

  def destroy
    @test.destroy

    redirect_to admin_tests_path, notice: t('.notice')
  end

  private

  def set_tests
    @tests = Test.all
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
