class LoginPage < SitePrism::Page
  # ELEMENTS
  set_url 'http://demo.redmine.org/login'
  element :user_name_filed, '#username'
  element :password_filed, '#password'
  element :submit_btn, '#login-form > form > table > tbody > tr:nth-child(4) > td:nth-child(2) > input[type=submit]'


  #   METHODS
end