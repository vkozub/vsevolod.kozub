module FeatureHelper
  def login(user_name, password)
      @login_page = LoginPage.new
      @login_page.load

      @login_page.user_name_filed.set user_name
      @login_page.password_filed.set password
      @login_page.submit_btn.click
  end
end
