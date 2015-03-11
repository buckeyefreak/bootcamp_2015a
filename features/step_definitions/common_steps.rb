Given /^I am on the "(.*?)" page$/ do |page_name|
  #use titleize gem
  # pagename = page_name.titleize.gsub(' ','') + "Page"

  #don't use gem - get same result for page name
  pagename = page_name.split(' ').map{|word| word.downcase.capitalize}.join + "Page"

  # eval(pagename) converts string to literal so that class instance can be created
  @current_page = eval(pagename).new

  @current_page.visit
end

Then /^I will be on the "([^"]*)" page$/ do |page_title|
  if @current_page.window_count > 1
    @current_page.use_last_window
  end
  expect(@current_page.browser_title).to include(page_title)
end
Given /^I click the "([^"]*)" link$/ do |link_name|
  @current_page.navigate_by_link(link_name)
end

When /^I navigate from the "([^"]*)" page to the "([^"]*)" page$/ do |from_page,to_page|
  navigate(from_page, to_page)
end