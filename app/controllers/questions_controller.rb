class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index]
  before_action :find_question, only: %i[show]

  def index
    render inline: "<h1>Questions for <%= @test.title %></h1><p><%= @test.questions.each do |question| %> <p> <%= question.body %></p><% end %></p>"
  end

  def show
    render inline: "<h1><%= @question.body %></h1>"
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end
end
