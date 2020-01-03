class LoginPage < SitePrism::Page
  # ELEMENTS
  # set_url 'http://10.131.40.173/login'
  element :user_name_field, '#username'
  element :password_field, '#password'
  element :submit_btn, "#login-submit"


  #   METHODS
end