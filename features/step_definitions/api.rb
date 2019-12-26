Given(/^I get all users$/) do
  # response = get_user_list
  # p response.code
  # mail =  JSON.parse(response.body)['users'][0]['mail']
  # mail =  JSON.parse(response.body)
  # binding.pry
  # p mail
  # p response.headers
  response2 = create_new_user_api
  # p response2

  mail =  JSON.parse(response2.body)
  p mail



end