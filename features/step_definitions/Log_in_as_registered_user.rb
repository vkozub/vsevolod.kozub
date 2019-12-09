Given(/^I am not logged in user$/) do
  visit 'http://demo.redmine.org/'
end

When(/^I click Sign in button$/) do
  find(:xpath, '//*[@id="account"]/ul/li[1]/a').click
end

Then(/^Login page is opened$/) do
  expect(current_url).to include '/login'
  expect(page).to have_content 'Login:'
  expect(page).to have_content 'Password:'
end

When(/^I fill valid credentials in$/) do
  find('#username').set 'member0'
  find('#password').set 'test123456'
  sleep 2
end

And(/^I click Login button$/) do
  find(:xpath, '//*[@id="login-form"]/form/table/tbody/tr[4]/td[2]/input').click
end

Then(/^I am logged in$/) do
  expect(page).to have_content 'Logged in as'
  expect(page).to have_content 'My account'

end