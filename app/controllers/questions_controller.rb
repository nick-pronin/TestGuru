class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_question_not_found

  def index
    render inline: "<h1>Questions for <%= @test.title %></h1><p><%= @test.questions.each do |question| %> <p> <%= question.body %></p><% end %></p>"
  end

  def show
    # render inline: "<h1>Question № <%= @question.test.questions.index(@question) + 1 %> for test <%= @question.test.title %></h1><p><%= @question.body %></p>"
  end

  def new; end

  def create
    @test.questions.create(question_params)

    redirect_to test_questions_path
  end

  def destroy
    @question.destroy!

    redirect_to test_questions_path(@question.test_id)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_from_question_not_found
    render plain: 'Question not found'
  end
end
