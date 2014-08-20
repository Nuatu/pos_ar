require 'bundler/setup'
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }



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
    puts "Press '9' to add employee's contribution to project."
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
      assign_employee_project
    when '8'
      assign_employee_division
    when '9'
      assign_employee_contribution
    when 'e'
      puts "Good-bye!"
    else
      puts "Sorry, that wasn't a valid option."
    end
  end
end
welcome
