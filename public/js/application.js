$(document).ready(function() {
  $(".login-link").on("click", add_login_form);
  $(".login-box").on('submit', log_user_in);
  $(".registration-link").on("click", add_registration_form);
  $(".registration-box").on('submit', create_new_user)
});

var add_login_form = function(event) {
  event.preventDefault();
  var login_div = this;

  $.ajax({
    type: "get",
    url: "/users/login",
  }).done(function(response) {
    if ($(".login-box").children().length == 0) {
      $(".login-box").append(response);
    } else {
      $(".login-box").html(response);
    }
  })
}

var log_user_in = function(event) {
  event.preventDefault();
  var form = $(this).children();
  var path = form.attr("action");
  var method = form.attr("method");
  var loginInfo = form.serialize();
  var loginForm = this;

  $.ajax({
    type: method,
    url: path,
    data: loginInfo
  }).done(function(response) {
    form.remove();
    $('.login-box').append(response);
  })
}

var add_registration_form = function(event) {
  event.preventDefault();
  var register_div = this;

  $.ajax({
    type: "get",
    url: "/users/new",
  }).done(function(response) {
    if ($(".registration-box").children().length == 0) {
      $(".registration-box").append(response);
    } else {
      $(".registration-box").html(response);
    }
  })
}

var create_new_user = function(event) {
  event.preventDefault();
}
