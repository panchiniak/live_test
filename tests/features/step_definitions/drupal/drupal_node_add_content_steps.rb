#encoding: utf-8

E /^preenche o título com '(.+)'$/ do |node_title|
  on DrupalNodeAddContentPage do |page| 
    page.fill_node_title node_title
  end  
end

E /^preenche o campo '(.+)' com '(.+)'$/ do |text_field_label,text_field_value|  
  on DrupalNodeAddContentPage do |page|
    field_id = page.label_element(:text=>text_field_label).html.inspect.scan(/\\"([^\\]*)\\/).first
    #puts field_id    
    #@todo: dinamically create a class called DrupalNodeAddContentPageTextField
    #append field_id to id, doing
    #text_field :node_text_field, :id => field_id
    #def fill_node_text_field field_value
    #self.node_text_field = field_value
    #end
    #on DrupalNodeAddContentPageTextField do |page|
    #page.fill_node_text_field text_field_value   
  end
  #end
  pending
end

E /^marca o checkbox '(.+)' como '(.+)'$/ do |node_checkbox_1,node_checkbox_1_value|
  #visit IntelbrasHomePage #pending
  pending
end