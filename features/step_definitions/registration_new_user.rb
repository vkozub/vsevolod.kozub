Given(/^I am not registered user$/) do
  @home_page = HomePage.new
  @home_page.load
end

When(/^I click Register link$/) do
  @home_page.top_menu.register_link.click
end

Then(/^Registration page is opened$/) do
  expect(current_url).to include "/account/register"
  expect(page).to have_content "Confirmation"
end

When(/^I fill in valid data$/) do
  @registration_page = RegistrationPage.new
  create_new_user
  @registration_page.login.set @user_name
  sleep 1
  @registration_page.password_registration.set @password
  sleep 1
  @registration_page.password_confirmation.set @password
  sleep 1
  @registration_page.first_name.set @first_name
  sleep 1
  @registration_page.last_name.set @last_name
  sleep 1
  @registration_page.email.set @email
  sleep 1
  find(:xpath, '//*[@id="user_language"]/option[16]').click
  # select("en", from: '#user_language')
  # @registration_page.language
  sleep 1

end

And(/^I click submit button$/) do
  @registration_page.submit_btn_registration.click
  sleep 2
end

Then(/^I am an registered user$/) do
  expect(current_url).to include "/my/account"
  expect(page).to have_content "Logged in as #{@user_name}"
end

Given(/^I sign out from my account$/) do
  # binding.pry
  sleep 2
  # find('Sign Out', visible: false).trigger('click')
  # @my_account_page = MyAccountPage.new
  # expect(@registration_page.top_menu.register_link).to be_visible
  # @my_account_page.top_menu.register_link.click
  # expect(find("#account"))
  # expect(page).to have_content "Sign out"
  # find('#content > form > p > input[type=submit]').click
  # within('#account') do
  #   click_link('Sign out')
    # find('.logout').click
  # end
  # find('.logout').click
  find(:xpath, '//*[@id="account"]/ul/li[2]/a').click
  # find('#account > ul > li:nth-child(2) > a').click
  # click_link('Sign out')
  # find_link(class: ['logout'], :visible => :all).visible?
end

# Then(/^I navigate to homepage$/) do
#   expect(page).to have_content "Sign in"
# end
#
# When(/^I click on Sign in link$/) do
#   @home_page.top_menu.sign_in_link.click
# end
#
# When(/^I fill in my credentials$/) do
#   @login_page = LoginPage.new
#   @login_page.user_name_filed.set @user_name
#   @login_page.password_filed.set @password
#   sleep 2
# end
#
# And(/^I click on Login button$/) do
#   @login_page.submit_btn.click
# end
#
# Then(/^I am accessed to my account$/) do
#   expect(page).to have_content "Logged in as #{@user_name}"
# end


