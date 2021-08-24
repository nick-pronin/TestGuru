module TestPassagesHelper

  def total_questions_helper
    t('helpers.test_passages.total_questions', count: @test_passage.test.total_questions)
  end

  def result_message(result)
    if @test_passage.successful?
      content_tag(:h2, t('helpers.test_passages.positive_result', result: result), class: 'alert-success')
    else
      content_tag(:h2, t('helpers.test_passages.negative_result', result: result), class: 'alert-danger')
    end
  end
end
