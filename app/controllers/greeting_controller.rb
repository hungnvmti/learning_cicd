class GreetingController < ApplicationController
  def index
    begin
      ActiveRecord::Base.establish_connection # Establishes connection
      ActiveRecord::Base.connection # Calls connection object
      puts "CONNECTED!" if ActiveRecord::Base.connected? 
      puts "NOT CONNECTED!" unless ActiveRecord::Base.connected?
    rescue
      puts "NOT CONNECTED!"
    end

  	total = sum 1,1 
    Greeting.create(title: "HungNV", description: "Code Artist")

    #greeting = Greeting.first
  	@message = "Hello "+ greeting.title.to_s + ", how are you today? Could you help me check the results? it's correct or not: 1 + 1 = " + total.to_s
    # @message = "Hello, how are you today? Could you help me check the results? it's correct or not: 1 + 1 = " + total.to_s
  
  end

  # def greeting
  # 	@greeting ||= Greeting.create(title: "David", description: "Code Artist")
  # end

  def sum (a,b)
  	total = a + b
  	return total
  end
end
