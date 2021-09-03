class GistQuestionService

# ACCESS_TOKEN=''

  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    @gist_answer = @client.create_gist(gist_params)
  end

  def success?
    response = @client.last_response
    return true if response.status == 201
    # @gist_answer[:html_url].present?
  end

  def default_client
    Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

  private

  def gist_params
    {
      description: I18n.t('services.gist_question_service.gist_description', title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
