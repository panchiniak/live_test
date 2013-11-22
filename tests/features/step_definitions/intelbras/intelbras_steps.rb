#encoding: utf-8

#int-542
Dado /^que eu estou na página inicial do Portal Intelbras$/ do
  visit IntelbrasHomePage
end

Quando /^eu busco por '(.+)'$/ do |search_term|
  on IntelbrasHomePage do |page| page.search_for search_term end
end

Entao /^eu deveria ver (\d+) resultados$/ do |search_results|
  on IntelbrasSearchResultsPage do |page|
    page.search_results.should =~ /^.+#{search_results}.+$/
  end
end

#int-688
Quando /^a componente '(.+)' é acessada$/ do |intelbras_component|
  visit IntelbrasHomePage #pending
end

Então /^deveriam ser visíveis '(.+)' e '(.+)' nos slides em exibição$/ do |node_title, product_subtitle|
  visit IntelbrasHomePage #pending
end

