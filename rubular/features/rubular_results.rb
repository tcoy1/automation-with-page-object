require 'page-object'

class RubularResults
  include PageObject
  
  div(:match_results, id: 'match_string')
  div(:match_groups, id: 'match_captures')
  
  def get_match_results
    return self.match_results_element.span_element.span_element.text
  end
  
  def get_match_groups (i, str)
    i -= 1
    
    if str == "group" then
      return self.match_groups_element.table_element[i][1].text
    elsif str == "num" then
      return self.match_groups_element.table_element[i][0].text
    end
  end
end