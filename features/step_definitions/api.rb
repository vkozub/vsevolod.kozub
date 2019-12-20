Given(/^I get all users$/) do
  response = get_user_list
  # p response.code
  # mail =  JSON.parse(response.body)['users'][0]['mail']
  mail =  JSON.parse(response.body)
  binding.pry
  p mail
  # p response.headers
end