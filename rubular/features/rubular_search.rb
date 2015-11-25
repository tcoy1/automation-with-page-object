require 'page-object'

class RubularSearch
  include PageObject
  
  page_url 'rubular.com'
  
  text_field(:search_field, id: 'regex')
  text_area(:test_field, id: 'test')
	
	def search_for (phrase)
	  self.search_field = phrase
	end
	
	def test_with (phrase)
	  self.test_field = phrase
	end
end