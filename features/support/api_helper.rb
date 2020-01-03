require 'rest-client'

module APIHelper

  def get_info_project
    @response_api = RestClient.get "http://10.131.40.173/projects/#{@project_identifier}.json", {'Content-Type' => 'application/json', 'X-Redmine-API-Key' => '1edaba58e5d75580c1b12747a3467b72084d5170'}

  end


  def get_user_list
    RestClient.get 'http://10.131.40.173/users.json', {'Content-Type' => 'application/json', 'X-Redmine-API-Key' => '1edaba58e5d75580c1b12747a3467b72084d5170'}
  end

  def create_new_user_api
    # @first_names_array = Array.new
    # @last_names_array = Array.new
    # @first_names_array = ['Jake', 'Ishido', 'Barbara', 'Crol', 'Tanya', 'Christen']
    # @last_names_array = ['Obama', 'Merkel', 'Benqsiemens', 'Yamasaki', 'Bundler', 'Poroshen']
    # @password = 'test123456'
    #
    # @user_name = 'user_name_' + Time.now.to_i.to_s
    # @first_name = @first_names_array[rand(6)]
    # @last_name = @last_names_array[rand(6)]
    # @email = @first_name + '@' + @last_name + '.com'


    payload_user = {
        'user' => {
        'login' => @user_name,
        'firstname' => @first_name,
        'lastname' => @last_name,
        'mail' => @email,
        'password' => @password}}


    @response_api_create_user = RestClient.post 'http://10.131.40.173/users.json', payload_user.to_json, {'Content-Type' => 'application/json', 'X-Redmine-API-Key' => '1edaba58e5d75580c1b12747a3467b72084d5170'}

  end

  def add_user_membership
    user_id_1 = JSON.parse(@response_api_create_user.body)['users']['id']

    payload_membership = {
            'membership' => {
            'user_id' => user_id_1
            'role_ids' => '4'}}

    @response_api_add_membership = RestClient.post "http://10.131.40.173/projects/#{@project_identifier}/memberships.json", payload_membership.to_json, {'Content-Type' => 'application/json', 'X-Redmine-API-Key' => '1edaba58e5d75580c1b12747a3467b72084d5170'}

  end
end