module TestPassagesHelper

  def total_questions_helper
    "Total questions: #{@test_passage.test.total_questions}"
  end

  def result_message(result)
  if @test_passage.successful?
    content_tag(:h2,
                "Congratulations! Your result is #{result}%, you passed the test.",
                class: 'positive_result')
  else
    content_tag(:h2,
                "Sorry! Your result is #{result}%, you failed the test.",
                class: 'negative_result')
  end
end
end
