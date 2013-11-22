#encoding: utf-8

BASE_URL = ENV['BASE_URL']

HIPCHAT_TOKEN = ENV['HIPCHAT_TOKEN']
HIPCHAT_ROOM = ENV['HIPCHAT_ROOM']

require 'cucumber/formatter/unicode'
require 'watir-webdriver'
require 'page-object'
require 'page-object/page_factory'
require 'hipchat-api'

hipchat_api = HipChat::API.new(HIPCHAT_TOKEN)

$: << File.dirname(__FILE__)+'/../../lib'

require 'pages.rb'


if ENV['HEADLESS'] == 'true'
  require 'headless'
  headless = Headless.new
  if headless.start
    puts "Headless mode: ON."
  end
  at_exit do
    headless.destroy
  end
end

World PageObject::PageFactory

driver = (ENV['WEB_DRIVER'] || :firefox).to_sym
client = Selenium::WebDriver::Remote::Http::Default.new
client.timeout = 180
  
browser = Watir::Browser.new driver, :http_client => client

Before { @browser = browser }

After do |scenario|  

  Dir::mkdir('screenshots') if not File.directory?('screenshots')
  
  def screenshot_name screenshot_type, scenario_name
    screenshot = "./screenshots/" + screenshot_type + "_#{scenario_name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
    @browser.driver.save_screenshot(screenshot)
    embed screenshot, 'image/png'
    return screenshot
  end
  
  def hipchat_message scenario_name, test_resut
    if test_resut == 'aprovado'
      message_color = 'green'
    end
    if test_resut == 'reprovado'
      message_color = 'red'
    end
    
    hipchat_api.rooms_message(HIPCHAT_ROOM, 'Talher Bot', 'Cenário ' + test_resut + ': ' + scenario_name, notify = 0, color = message_color, message_format = 'html')    

    return test_resut
  end  
  
  if scenario.failed?
    screenshot = screenshot_name("FAILLED", scenario.name)    
    hipchat_message scenario.name, 'reprovado'
    
  end
  if ENV['FULLSHOT'] == 'true'
    if scenario.passed?
      screenshot = screenshot_name("PASSED", scenario.name)      
      hipchat_message scenario.name, 'aprovado'
    end
  end
end

at_exit { browser.close }
