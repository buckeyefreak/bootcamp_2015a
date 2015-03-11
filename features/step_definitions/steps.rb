Given(/^I open the "(.*?)" browser$/) do |browser|
  @browser_opened = Watir::Browser.new transformation(browser).to_sym
end

Then(/^the "(.*?)" browser is open$/) do |browser|

  @browser_opened = @browser_opened.name
  @expected_browser = transformation(browser)

  fail ("The #{@expected_browser} browser is not open.") unless @expected_browser == @browser_opened
end