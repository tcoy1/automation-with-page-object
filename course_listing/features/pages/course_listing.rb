require 'page-object'

class CourseListing
  include PageObject
  
  page_url 'http://global.cscc.edu/courses/course.asp?Z=&D=B&Q=SP&Y=16&C=CSCI-2994&T='
  
  div(:course_info_div, id: 'course-info')
  
  link(:bookstore_link, text: 'View required and optional textbooks for CSCI2994.')
  
  def check_prereqs
    headers = self.course_info_div_element.h3_elements
    paragraphs = self.course_info_div_element.paragraph_elements
    for i in 0..(headers.length - 1)
      if headers[i].text == "Prerequisites:" then
        x = i
      end
    end
    
    return paragraphs[x].text
  end
end