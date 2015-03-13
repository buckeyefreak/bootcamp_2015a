######### exists--------------------------------------------------------
Then(/^I see "(.*?)"$/) do |section|
  section = section.downcase.gsub!(' ','_')
    expect(@current_page.send(section)).to be_visible
end

######## default values/options-----------------------------------------------
Then(/^the "(.*?)" should be "([^"]*)"$/) do |option, value|
  value.gsub!(' ','')
  value.gsub!('/','_')
  value.gsub!('$','')
  value.downcase!

  option.gsub!(' ','_')
  option.downcase!

  page_result = @current_page.send(option)

  case option
    when 'default_date'
      expected_result = value.split('_').map{|x| x.to_i}

    when 'default_bond'
      expected_result = value

    when 'default_amount'
      expected_result = value

    when 'denomination_options'
      expected_result = value.split(',').map{|x| x}
      page_result.each do |remove|
        remove.gsub!('$','')
        remove.gsub!(' ','')
        remove.gsub!(',','')
      end

    when 'bond_options'
      expected_result = value.split(',').map{|x| x}
      page_result.each do |remove|
        remove.gsub!(' ','')
        remove.downcase!
      end

    else
      result = false
  end

  if page_result.kind_of?(Array)
    puts page_result
    puts expected_result
    expect(page_result.sort).to eq(expected_result.sort)
  else
    puts page_result
    puts expected_result
    expect(page_result.downcase).to eq(expected_result)
  end
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