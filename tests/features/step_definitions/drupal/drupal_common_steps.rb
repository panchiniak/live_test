#encoding: utf-8

Dado /^que eu estou na página '(.+)'$/ do |drupal_relative_url|
  on DrupalCommonPage do |page| 
    page.visit_relative_url drupal_relative_url
  end  
end
