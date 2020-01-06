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
  # sleep 2
end

And(/^I become logged in as 'admin' user$/) do
  expect(page).to have_content  "Logged in as #{@admin_username}"
  # sleep 2
end

When(/^I create a project$/) do
  expect(page).to have_content 'Projects'
  @home_page.top_menu.projects_link.click
  # sleep 2
  expect(current_url).to include '/projects'
  find('#content > div.contextual > a').click
  expect(current_url).to include '/projects/new'

  @new_project_page = NewProjectPage.new
  @new_project_page.project_name_field.set @project_name
  @new_project_page.project_identifier_field.set @project_identifier
  # sleep 2
  @new_project_page.create_project_button.click
end

Then(/^I see that project is created on 'UI' level$/) do
  @home_page.top_menu.projects_link.click
  # sleep 2
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
  # sleep 2
  click_link("#{@project_name}")
  expect(current_url).to include "/projects/#{@project_identifier}"
  expect(page).to have_content @first_name + ' ' +  @last_name
  expect(page).to have_content 'Developer:'
end

When(/^I create an issue and assign 'developer' user to created issue$/) do
  @issues_page = IssuesPage.new
  @issues_page.main_menu.issues_li.click
  @issues_page.new_issue_link.click
  expect(current_url).to include "/projects/#{@project_identifier}/issues/new"

  @new_issue_page = NewIssuePage.new
  @new_issue_page.issue_subject.set 'IE: Wrong color of layout'
  # select("#{@first_name + @last_name}", from: @new_issue_page.issue_assigned_to_id) "#{@first_name + @last_name}" @new_issue_page.issue_assigned_to_id
  # select(value = @user_id_add, from: '#issue_assigned_to_id')
  find(:xpath, '//*[@id="issue_assigned_to_id"]/option[3]').click
  # sleep 2
  @new_issue_page.issue_create_btn.click
  # sleep 3
end

Then(/^I see the issue is created$/) do
  expect(page).to have_content 'IE: Wrong color of layout'
  expect(page).to have_content 'Issue '
  expect(page).to have_content ' created.'
end

And(/^I see 'developer' user is assigned to the issue$/) do
  expect(page).to have_content @first_name + ' ' + @last_name
end

When(/^I logout$/) do
  @home_page.top_menu.sign_out_link.click
  sleep 3
  expect(current_url).to eq 'http://10.131.40.173/'
  sleep 3
end

When(/^I login as 'developer' user$/) do
  @login_page = LoginPage.new
  @home_page.top_menu.sign_in_link.click
  expect(current_url).to include '/login'
  @login_page.user_name_field.set @user_name
  @login_page.password_field.set @password
  # sleep 2
  @login_page.submit_btn.click
end

Then(/^I become logged in as 'developer' user$/) do
  expect(page).to have_content "Logged in as #{@user_name}"
end

When(/^I track time for the assigned issue$/) do
  @home_page.top_menu.projects_link.click
  expect(current_url).to include '/projects'
  find('#main-menu > ul > li:nth-child(3) > a').click
  # @issues_page.main_menu.issues_li.click
  # sleep 2
  find_link('Actions').click
  # sleep 2
  find('#context-menu > ul > li:nth-child(2) > a').click
  # sleep 2
  find('#context-menu > ul > li:nth-child(2) > ul > li:nth-child(2) > a').click
  # sleep 3
end

Then(/^I see the time is tracked properly$/) do
  expect(page).to have_content 'In Progress'
  # sleep 3
end

When(/^I close the issue$/) do
  find_link('Actions').click
  find('#context-menu > ul > li:nth-child(2) > a').click
  find('#context-menu > ul > li:nth-child(2) > ul > li:nth-child(4) > a').click

end

Then(/^I see the issue was closed$/) do
  expect(page).to have_content 'Closed'
  # sleep 3
  @home_page.top_menu.projects_link.click
  expect(current_url).to include "/projects"
  sleep 2
  click_link("#{@project_name}")
  expect(current_url).to include "/projects/#{@project_identifier}"
  expect(page).to have_content @first_name + ' ' +  @last_name
  # sleep 2
  find_link("#{@first_name + ' ' + @last_name}").click
  # sleep 3
  expect(find('#activity')).to have_content '(Closed): IE: Wrong color of layout'
  # sleep 3

end

When(/^I logout again$/) do
  @home_page.top_menu.sign_out_link.click
  # sleep 2
end

Then(/^I am not logged in visitor again$/) do
  expect(current_url).to eq 'http://10.131.40.173/'
  # sleep 3
end

When(/^I login as 'admin' user$/) do
  @home_page.top_menu.sign_in_link.click
  expect(current_url).to include '/login'
  @login_page.user_name_field.set @admin_username
  @login_page.password_field.set @admin_password
  @login_page.submit_btn.click
end

When(/^I close the project$/) do
  @home_page.top_menu.projects_link.click
  click_link("#{@project_name}")
  find('#content > div.contextual > a.icon.icon-lock').click
  page.driver.browser.switch_to.alert.accept
end

Then(/^I see it was successfully closed$/) do
  expect(page).to have_content 'This project is closed and read-only.'
  @home_page.top_menu.projects_link.click
  expect(page).not_to have_content "#{@project_name}"
  @home_page.top_menu.sign_out_link.click
end


