document.addEventListener('turbolinks:load', function() {
  var password_confirmation_input = document.getElementById('user_password_confirmation');

  password_confirmation_input.oninput = function() {
    validate_password();
  }
})

function validate_password() {
  var alert_element = document.querySelector(".alert");
  var password = document.getElementById('user_password');
  var password_confirmation = document.getElementById('user_password_confirmation');

  if (password_confirmation.value != "") {
    if (password.value == password_confirmation.value) {
      alert_element.innerHTML = "Пароли совпадают";
    } else {
      alert_element.innerHTML = "Пароли не совпадают";
    }
  } else {
    alert_element.innerHTML = "";
  }

}
