require 'page-object'

class CourseSearch
  include PageObject
  
  page_url 'cscc.edu'
  
  text_field(:search_phrase, name: 'q')
  
  link(:course_link, text: 'CSCI-2994 - Current Topics')
  
  def search_for(phrase)
    self.search_phrase = phrase
    @browser.send_keys :enter
  end
end