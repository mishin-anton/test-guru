document.addEventListener('turbolinks:load', function() {
  var progressBar = document.getElementById('test_progress');

  var questionNumber = progressBar.dataset.questionNumber;
  var questionCount = progressBar.dataset.questionsCount;
  var progress = (questionNumber - 1) / questionCount * 100;

  progressBar.style.width = progress + "%";

})
