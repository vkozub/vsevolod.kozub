Given(/^I am not logged in user$/) do
  # visit 'http://demo.redmine.org/'
  @home_page = HomePage.new
  @home_page.load
end

When(/^I click Sign in button$/) do
  @home_page.top_menu.sign_in_link.click
  # find(:xpath, '//*[@id="account"]/ul/li[1]/a').click
  # find_link('Sign in').click
  # @home_page.top_menu.sign_in_link.click
end

Then(/^Login page is opened$/) do
  expect(current_url).to include '/login'
  expect(page).to have_content 'Login:'
  expect(page).to have_content 'Password:'
end

When(/^I fill valid credentials in$/) do
  @login_page = LoginPage.new
  @login_page.user_name_filed.set 'member0'
  @login_page.password_filed.set 'test123456'
  # find('#username').set 'member0'
  # find('#password').set 'test123456'
  sleep 2
end

And(/^I click Login button$/) do
  @login_page.submit_btn.click
  sleep 2
  # find(:xpath, '//*[@id="login-form"]/form/table/tbody/tr[4]/td[2]/input').click
  # find_button(value: 'Login »').click
end

Then(/^I am logged in$/) do
  expect(page).to have_content 'Logged in as'
  expect(page).to have_content 'My account'
end

Given(/^I am logged in "([^"]*)"$/) do |user_name|
  login user_name, 'test123456'
end

Then(/^Account is opened for "([^"]*)"$/) do |user_name|
  expect(page).to have_content "Logged in as #{user_name}"
  sleep 2
end

When(/^I click Sign out buton$/) do
  # find(:xpath, '//*[@id="account"]/ul/li[2]/a').click
  click_link('Sign out')
  sleep 1
end