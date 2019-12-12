class HomePage < SitePrism::Page
  # ELEMENTS
  set_url 'http://demo.redmine.org/'
  section :top_menu, TopMenu, '#top-menu'
  # METHODS
end