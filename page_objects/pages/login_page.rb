class LoginPage < SitePrism::Page
  # ELEMENTS
  set_url 'http://10.131.40.173/login'
  element :user_name_filed, '#username'
  element :password_filed, '#password'
  element :submit_btn, "#login-submit"


  #   METHODS
end