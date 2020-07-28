document.addEventListener('turbolinks:load', function() {
    var timer = document.querySelector('.timer');
    if (timer) { countdown(timer) }
});

function countdown(timer) {
    var startTime = Date.now();
    var endTime = startTime + (timer.dataset.duration * 1000);
    var timeRemain = (endTime - startTime) / 1000;

    setInterval(function() {
        document.querySelector('.timer').textContent = timeRemain + ' seconds';
        timeRemain -= 1;

        if (timeRemain < 0) {
          finishTest();
        }
    }, 1000)
}

function finishTest() {
  var host = window.location.origin
  var userTestId = window.location.pathname.replace('/user_tests/', '')

  window.location.href = `${host}/user_tests/${userTestId}/result`
}
