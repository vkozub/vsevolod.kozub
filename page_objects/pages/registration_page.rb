class RegistrationPage < SitePrism::Page
  # ELEMENTS
  element :login, "#user_login"
  element :password_registration, "#user_password"
  element :password_confirmation, "#user_password_confirmation"
  element :first_name, "#user_firstname"
  element :last_name, "#user_lastname"
  element :email, "#user_mail"
  element :language, "#user_language"
  element :submit_btn_registration, "#new_user > input[type=submit]:nth-child(4)"
end