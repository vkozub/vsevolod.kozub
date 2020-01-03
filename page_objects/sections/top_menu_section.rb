class TopMenu < SitePrism::Section
  element :sign_in_link,  "#account > ul > li:nth-child(1) > a"
  element :register_link, "#account > ul > li:nth-child(2) > a"
  element :sign_out_link, "#account > ul > li:nth-child(2) > a"
  element :projects_link, "#top-menu > ul > li:nth-child(3) > a"
  # element :sign_out_link, "#account > ul > li:nth-child(2) > a"
#   :xpath, '//*[@id="account"]/ul/li[1]/a' 'Sign in'
# #account > ul > li:nth-child(1) > a
end