class MainMenu < SitePrism::Section

  element :projects_li, '#main-menu > ul > li:nth-child(1) > a'
  element :issues_li, '#main-menu > ul > li:nth-child(3) > a'
  element :overview_li, '#main-menu > ul > li:nth-child(2) > a'
  element :settings_li, '#main-menu > ul > li:nth-child(12) > a'

end