require 'rest-client'

module APIHelper

  def get_user_list
    RestClient.get 'http://10.131.40.173/users.json', {'Content-Type' => 'application/json', 'X-Redmine-API-Key' => '1edaba58e5d75580c1b12747a3467b72084d5170'}
  end

end