Given /^I am on the "(.*?)" page$/ do |page_name|
  #use titleize gem
  pagename = page_name.downcase.titleize.gsub(' ','') + "Page"

  #don't use gem - get same result for page name
  # pagename = page_name.downcase.split(' ').map{|word| word.capitalize}.join + "Page"

  # eval(pagename) converts string to literal so that class instance can be created
  @current_page = eval(pagename).new

  @current_page.visit
end