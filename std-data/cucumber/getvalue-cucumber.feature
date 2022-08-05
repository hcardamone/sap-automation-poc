    
    
    Feature: getvalue-cucumber
    
    Scenario: get_external_value
    Given that xbox page was open
    When found the expected "game"
    And the "game" data information displayed
    Then get the "game" data information
    And save the "game" data information 

Given('that xbox page was open') do |open|
  puts "open: #{open}"
end