document.addEventListener('turbolinks:load', function () {
  let progress = document.querySelector('.progress')
  let progressBar = document.querySelector('.progress-bar')

  if (progress && progressBar) {
    let question = progressBar.dataset.currentQuestion
    let questions = progressBar.dataset.totalQuestions

    progressBar.style.width = question / questions * 100 + "%"
  }
})
