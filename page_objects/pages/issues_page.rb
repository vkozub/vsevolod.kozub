class IssuesPage < SitePrism::Page

  section :main_menu, MainMenu, '#main-menu'
  element :new_issue_link, '#content > div.contextual > a'

end