class IntelbrasSearchResultsPage
  include PageObject
  expected_title /.+ Busca | Intelbras\./
  expected_element :class => 'view-header'
  div :search_results, :class => 'view-header'
end