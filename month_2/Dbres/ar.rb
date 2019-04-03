require 'active_record' 

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'Restaurant_db.sqlite3'
)

class Restaurant < ActiveRecord::Base
  has_many :tables
end

class Table < ActiveRecord::Base
  belongs_to :restaurants
  has_many :bookings 
end

class Customers < ActiveRecord::Base
  has_many :bookings
end

class Bookings < ActiveRecord::Base
  belongs_to :customers
  belongs_to :Table
end















