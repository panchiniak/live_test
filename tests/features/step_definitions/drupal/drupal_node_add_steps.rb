#encoding: utf-8

E /^adiciona o conteúdo do tipo '(.+)'$/ do |content_type|  
  visit DrupalNodeAddPage do |page|
    page.div_element(:class=>'content').unordered_list_element(:class=>'admin-list').link_element(:link_text => content_type).click
  end
end