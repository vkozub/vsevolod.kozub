Given(/^I am not logged in visitor$/) do
  @home_page = HomePage.new
  @home_page.load
end

When(/^I register 'admin' user via Redmine 'UI'$/) do
  initialize
  @home_page.top_menu.sign_in_link.click
  expect(current_url).to include '/login'
end

Then(/^I see the 'admin' user is registered$/) do
  @login_page = LoginPage.new
  @login_page.user_name_field.set @admin_username
  @login_page.password_field.set @admin_password
  @login_page.submit_btn.click
  sleep 2
end

And(/^I become logged in as 'admin' user$/) do
  expect(page).to have_content  "Logged in as #{@admin_username}"
  sleep 2
end

When(/^I create a project$/) do
  expect(page).to have_content 'Projects'
  @home_page.top_menu.projects_link.click
  sleep 2
  expect(current_url).to include '/projects'
  find('#content > div.contextual > a').click
  expect(current_url).to include '/projects/new'

  @new_project_page = NewProjectPage.new
  @new_project_page.project_name_field.set @project_name
  @new_project_page.project_identifier_field.set @project_identifier
  sleep 2
  @new_project_page.create_project_button.click
end

Then(/^I see that project is created on 'UI' level$/) do
  @home_page.top_menu.projects_link.click
  sleep 2
  expect(page).to have_content @project_name
end

And(/^I see that project is created on 'API' level$/) do
  get_info_project
  expect(@response_api.code).to eq(200)
end


When(/^I register 'developer' user via Redmine 'API'$/) do
  create_new_user_credentials
  create_new_user_api
end

Then(/^I see the 'developer' user is registered$/) do
  expect(@response_api_create_user.code).to eq(201)
end

When(/^I add 'developer' user as a member of the project$/) do
  add_user_membership
  expect(@response_api_add_membership.code).to eq(201)
end

Then(/^I can can see 'developer' user in the project member list$/) do
  sleep 2
  click_link("#{@project_name}")
end

When(/^I create an issue and assign 'developer' user to created issue$/) do
  pending
end

Then(/^I see the issue is created$/) do
  pending
end

And(/^I see 'developer' user is assigned to the issue$/) do
  pending
end

When(/^I logout$/) do
  pending
end

When(/^I login as 'developer' user$/) do
  pending
end

Then(/^I become logged in as 'developer' user$/) do
  pending
end

When(/^I track time for the assigned issue$/) do
  pending
end

Then(/^I see the time is tracked properly$/) do
  pending
end

When(/^I close the issue$/) do
  pending
end

Then(/^I see the issue was closed$/) do
  pending
end

When(/^I login as 'admin' user$/) do
  pending
end

When(/^I close the project$/) do
  pending
end

Then(/^I see it was successfully closed$/) do
  pending
end


