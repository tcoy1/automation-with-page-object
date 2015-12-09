require 'page-object'

class CourseResults
  include PageObject
  
  divs(:search_result, class: 'gsc-webResult gsc-result')

end