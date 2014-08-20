class Employee < ActiveRecord::Base
  has_many :purchases
  has_many :returns
end
