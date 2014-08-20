require 'bundler/setup'
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/./lib/*.rb'].each { |file| require file }


ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))['development']
)

def welcome
  puts "Welcome to Point of Sale fuckers!"
  menu
end

def menu
  choice = nil
  until choice == 'e'
    puts "Press '1' to add a customer."
    puts "Press '2' to list your customers."
    puts "Press '3' to add a employee."
    puts "Press '4' to list your employees."
    puts "Press '5' to add a product."
    puts "Press '6' to list products."
    puts "Press '7' to add employee to project."
    puts "Press '8' to add employee to division."
    puts "Press '9' to show total purchase."
    puts "Press '10' to show total return."

    puts "Press 'e' to Exit"
    choice = gets.chomp
    case choice
    when '1'
      add_customer
    when '2'
      list_customers
    when '3'
      add_employee
    when '4'
      list_employees
    when '5'
      add_product
    when '6'
      list_products
    when '7'
      add_purchase
    when '8'
      list_purchases
    when '9'
      assign_product_purchase
    when '10'
      assign_product_return
    when '11'
      show_total_purchase
    when '12'
      show_total_return
    when 'e'
      puts "Good-bye!"
    else
      puts "Sorry, that wasn't a valid option."
    end
  end
end


def add_customer
  puts "Customer name to add?"
  customer_name = gets.chomp
  customer = Customer.create(name: customer_name)
end

def list_customers
  puts "Customers:"
  customers = Customer.all
  customers.each { |customer| puts "#{customer.id}. #{customer.name}" }
end

def add_employee
  puts "Employee name to add?"
  employee_name = gets.chomp
  employee = Employee.create(name: employee_name)
end

def list_employees
  puts "Employees:"
  employees = Employee.all
  employees.each { |employee| puts "#{employee.id}. #{employee.name}" }
end

def add_product
  puts "Product to add?"
  product_name = gets.chomp
  puts "How much does it cost?"
  price = gets.chomp
  puts "What is the brand name?"
  brand = gets.chomp
  product = Product.create(name: product_name, price: price, brand: brand )
end

def list_products
  puts "Products:"
  products = Product.all
  products.each { |product| puts "#{product.name}    Brand: #{product.brand}      Price: #{product.price}"}
end

def add_purchase
  puts "Press 'M' to go to main menu or anything else to continue."
  number = gets.chomp.to_i
  main_menu if number == 5
  list employees
  puts "Employee Number?"
  employee = gets.chomp.to_i
  list_customers
  puts "Customer Number?"
  customer = gets.chomp.to_i
  list_products
  loop
    puts "Product Number? or press 'M' to go to main menu"
    main_menu if gets.chomp.upcase == 'M'
    product = gets.chomp.to_i
    purchase = Purchase.create({employee_id: employee, product_id: product, customer_id: customer})
  end
end

def list_purchases
  puts "Employees:"
  employees = Employee.all
  employees.each { |employee| puts "#{employee.id}. #{employee.name}" }
end


def assign_product_purchase

end

welcome
