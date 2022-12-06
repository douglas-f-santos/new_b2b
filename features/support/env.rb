require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec/matchers'
require 'cucumber'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'rspec'
require 'bundler'
require 'site_prism'
require_relative 'helper.rb'
require 'pry'
require 'pry-byebug'
require 'faker'
require 'report_builder'
require 'json'
require 'capybara-screenshot/cucumber'
require 'capybara-screenshot/rspec'
require 'ffi'
require 'yaml'
require 'fileutils'
require 'br_documents'
require 'ffaker'
require 'cpf_cnpj'
require "cpf_cnpj_tools"


$execucao = []
$msg_falha = ''

BROWSER = ENV['BROWSER']
AMBIENTE = ENV['AMBIENTE']

NFS_ENTRADA = YAML.load_file(File.dirname(__FILE__) + "/arquivos_nfe_entrada/nfs_entrada.yml")
CONFIG = YAML.load_file(File.dirname(__FILE__) + "/ambientes/#{AMBIENTE}.yml")
DADOS_CAD = YAML.load_file(File.dirname(__FILE__) + "/ambientes/dados_cadastro.yml")

World(Capybara::DSL)
World(Capybara::RSpecMatchers)
World(PageObjects)
World(Helper)
#===
case  ENV["BROWSER"]
    when "firefox"
    @driver = :selenium
    when "chrome"    
    @driver = :selenium_chrome
    when "headless"    
    @driver = :selenium_chrome_headless
    else         
    puts "Invalid Browser"
end        


 Capybara.register_driver :chrome do |app|
   client = Selenium::WebDriver::Remote::Http::Default.new
   client.read_timeout = 200
   Capybara::Selenium::Driver.new(app, {browser: :chrome, http_client: client})
 end
 
Capybara.configure do |config|
   config.default_driver = :chrome    
   config.app_host = CONFIG['url'] 
   config.default_max_wait_time = 40
   Capybara.page.driver.browser.manage.window.maximize
end 

Capybara::Screenshot.register_driver(:chrome) do |driver, path|
  driver.browser.save_screenshot(path)
end

data_atual  = Time.now
$data_atual = data_atual.strftime("%Y%m%d")
$data_hora  = data_atual.strftime("%Y%m%d%H%M%S")
$destino = ''
