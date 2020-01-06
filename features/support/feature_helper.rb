module FeatureHelper
  def login(user_name, password)
      @login_page = LoginPage.new
      @login_page.load

      @login_page.user_name_filed.set user_name
      @login_page.password_filed.set password
      @login_page.submit_btn.click
  end

  def create_new_user
    @first_names_array = Array.new
    @last_names_array = Array.new
    @first_names_array = ['Jake', 'Ishido', 'Barbara', 'Crol', 'Tanya']
    @last_names_array = ['Bond', 'Craig', 'Kozub', 'Mashido', 'Toyota']
    @password = 'test123456'

    @user_name = 'user_name_' + Time.now.to_i.to_s
    @first_name = @first_names_array[rand(5)]
    @last_name = @last_names_array[rand(5)]
    @email = @first_name + '22@11' + @last_name + '.com'
    @language = 'English'
  end

  def initialize
    @admin_username = "user"
    @admin_password = "uTMM4isLhuB8"
    @project_identifier = "qazwsxedc123"
    @project_name = "Vsevolod_Kozub_Project"
  end


  def create_new_user_credentials
    @first_name = FFaker::Name.first_name
    @last_name = FFaker::Name.last_name
    @user_name = FFaker::Internet.user_name
    @email = FFaker::Internet.safe_email
    @password = FFaker::Internet.password
    @language = 'English'
  end
end
