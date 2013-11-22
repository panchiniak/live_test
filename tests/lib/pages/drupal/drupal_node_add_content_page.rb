# encoding: utf-8

class DrupalNodeAddContentPage
  include PageObject
  
  text_field :node_title_field, :name => 'title'  

  def fill_node_title node_title
    self.node_title_field = node_title
  end  
  
  text_field :node_text_field, :id => 'edit-field-subtitle-und-0-value'
  
  def fill_node_text_field text_field_value
    self.node_text_field = text_field_value
  end
  
end