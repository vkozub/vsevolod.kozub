class NewProjectPage < SitePrism::Page
  # ELEMENTS
  element :project_name_field, '#project_name'
  element :project_decription_field, '#project_description'
  element :project_identifier_field, '#project_identifier'
  element :create_project_button, '#new_project > input[type=submit]:nth-child(5)'
  element :create_continue_button, '#new_project > input[type=submit]:nth-child(6)'
  element :inherit_checkbox, '#project_inherit_members'
  element :homepage_field, '#project_homepage'




  #   METHODS


end