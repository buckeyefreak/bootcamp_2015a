Then(/^I see the "(.*?)" "(.*?)"$/) do |section, type|
  expect(
      case section
        when 'Savings Bond Calculator'
          expect(@current_page.calculator).to be_visible
        when 'Value as of'
          expect(@current_page.value).to be_visible
        when 'Series'
          expect(@current_page.series).to be_visible
        when 'Update'
          expect(@current_page.update).to be_visible
        when 'Denomination'
          expect(@current_page.denomination).to be_visible
        when 'Bond Serial Number'
          expect(@current_page.bond).to be_visible
        when 'Issue Date'
          expect(@current_page.issue).to be_visible
        when 'calculate'
          expect(@current_page.calculate).to be_visible
        when 'how to save your inventory'
          expect(@current_page.save).to be_visible
        when 'help'
          expect(@current_page.help).to be_visible
        when 'error message'
          expect(@current_page.error).to be_visible
        else
          fail("The #{section} #{type} is not allowed in this step.")
      end
  )
end
Then(/^the default value should be "([^"]*)"$/) do |default|
  expect(@current_page.default_method(default)).to be_truthy
end

Then(/^the options are "([^"]*)"$/) do |list_options|
  @current_page.list_method(list_options)
end

When(/^I have selected "([^"]*)"$/) do |bond_type|
  @current_page.select_bond(bond_type)
end

When(/^I have selected "([^"]*)" denomination$/) do |amount|
  @current_page.bond_denom(amount)
end

When(/^I have entered a "([^"]*)" in issue date field$/) do |entered_date|
  @current_page.enter_date(entered_date)
end
When(/^I click the "([^"]*)" "([^"]*)"$/) do |name, type|
  @current_page.calculate_now(name,type)
end