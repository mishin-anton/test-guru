function setTimer() {
  document.addEventListener('turbolinks:load', function() {
    var timer = document.getElementById('timer');
    var duration = timer.dataset.duration;

    if (duration) {
      var initialDateTime = new Date().getTime() + duration * 60 * 1000

      var t = setInterval(function() {
        var dateTimeNow = new Date().getTime();
        var distance = initialDateTime - dateTimeNow

        var hours   = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60))
        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60))
        var seconds = Math.floor((distance % (1000 * 60)) / 1000)

        document.getElementById("timer").innerHTML = hours + "h " + minutes + "m " + seconds + "s "

        if (distance < 1000) {
          clearInterval(t);
          alert('Время истекло.')
          finishTest()
        }
      }, 1000);
    }
  })
}

function finishTest() {
  var host = window.location.origin
  var userTestId = window.location.pathname.replace('/user_tests/', '')

  window.location.href = `${host}/user_tests/${userTestId}/result`
}
