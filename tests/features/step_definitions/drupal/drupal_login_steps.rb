#encoding: utf-8

Dado /^que o usuário está registrado com o nome '(.+)' e senha '(.+)'$/ do |user_name,user_pass|  
  visit DrupalLoginPage do |page| page.login_user user_name, user_pass end
end