class GreetingController < ApplicationController
  def index
    begin
      ActiveRecord::Base.establish_connection # Establishes connection
      ActiveRecord::Base.connection # Calls connection object
      puts "CONNECTED! current db #{ActiveRecord::Base.connection.current_database} tables: #{ActiveRecord::Base.connection.tables}" if ActiveRecord::Base.connected? 
      puts "NOT CONNECTED! #{ActiveRecord::Base.connection.current_database}" unless ActiveRecord::Base.connected?
    rescue
      puts "NOT CONNECTED!"
    end

  	total = sum 1,1 

   # greeting = Greeting.first.to_sql
  	@message = " how are you today? Could you help me check the results? it's correct or not: 1 + 1 = #{total.to_s}"  
  end

  # def greeting
  # 	@greeting ||= Greeting.create(title: "David", description: "Code Artist")
  # end

  def sum (a,b)
  	total = a + b
  	return total
  end
end
