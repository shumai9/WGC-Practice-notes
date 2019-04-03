
class Employee

  def initialize(employee_data)
    @age = employee_data[:age] 
    @hours = employee_data[:hours] 
    @overtime_hours= employee_data[:overtime_hours]
    @overtime_rate = 1.5
    @tax_percentage = 20.0
  end
  
  
  def hourly_rate
    case @age
    when 16...18
      4.05
    when 18...21
      5.60
    when 21...25
      7.05
    when 25..65
      7.50
    end
  end
  
  def normal_pay
    hourly_rate * @hours
  end
  
  def overtime_pay
    hourly_rate * @overtime_rate * @hours
  end
  
  def gross_pay
    normal_pay + overtime_pay
  end

  def tax
    @tax_percentage / 100 * gross_pay
  end

  def net_pay
    gross_pay - tax
  end
end




sophie = Employee.new(sophie = { age: 18, hours: 8, overtime_hours: 3})


puts sophie.normal_pay
puts sophie.overtime_pay
puts sophie.gross_pay
puts sophie.net_pay


puts %{Pay for Sophie:
  normal =>   #{sophie.normal_pay}
  overtime=> #{sophie.overtime_pay}
  gross:=>   #{sophie.gross_pay}
  net:=>      #{sophie.net_pay}
}

##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
#=============================================================================#
# What I have learned on this exercise                                        #
# How to initialize class instance variables (@)                              #
# Accessing Hash elements and saving them as @ var to be used by the class    #
# methods                                                                     #
#=============================================================================#
###############################################################################