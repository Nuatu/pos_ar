require 'bundler/setup'
Bundler.require(:default, :test)
Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

ATTRIBUTES = { 'name' => 'default_name'}

database_configurations = YAML::load(File.open('./db/config.yml'))
test_configuration = database_configurations['test']
ActiveRecord::Base.establish_connection(test_configuration)

RSpec.configure do |config|
  config.before(:each) do
    Customer.all.each { |customer| customer.destroy }
    Employee.all.each { |employee| employee.destroy }
    Product.all.each { |product| product.destroy }
  end
end
