Then /^I see a search field$/ do
  expect(@current_page.search).to be_visible
end

Then /^the search field value is "([^"]*)"$/ do |search_string|
  expect(@current_page.search_value).to eq(search_string)
end
Then /^I see a search button$/ do
  expect(@current_page.submit).to be_present
end
Then /^the search button label is "([^"]*)"$/ do |button_label|
  expect(@current_page.submit_label).to eq(button_label)
end

When(/^I submit a search "(.*?)"$/) do |search_string|
  @current_page.submit_search search_string
end

Then(/^I see "(.*?)" search result\(s\)$/) do |expected_count|
# parse expected count
  parse_count = expected_count.to_s.match(/(\d*)([a-z|A-Z ]*)(\d*)/)
  operator = parse_count[2].strip
  expected_count = parse_count[1] == '' ? parse_count[3].to_i : parse_count[1].to_i

# get the number of results
  actual_count = @current_page.results_count

# determine if step passes
  expect(HelperMethods.value_comparison(operator,actual_count,expected_count)).to be_truthy
end

Then /^a "([^"]*)" message displays$/ do |message|
  expect(@current_page.search_message).to match(/#{message}/)
end
Then /^I see the search term truncated to (\d+) characters$/ do |character_number|
# get length of search string from edit field
  expect(@current_page.search_term_length).to eq(character_number.to_i)
end