
sophie = {
  age: 18,
  normal_hours: 8,
  overtime_hours: 3
}

# Determine Sophie's wage based on National Minimum wage levels
sophies_hourly_rate = case sophie[:age]
when 16...18
  4.05
when 18...21
  5.60
when 21...25
  7.05
when 25..65
  7.50
end

# Set the overtime pay rate to time and a half
overtime_rate = 1.5

def normal_pay(hourly_rate, normal_hours)
  hourly_rate * normal_hours
end

# Calculate pay for normal working hours
sophies_normal_pay = normal_pay(sophies_hourly_rate,  sophie[:normal_hours])

# Calculate pay for overtime hours
sophies_overtime_pay = sophies_hourly_rate * overtime_rate * sophie[:overtime_hours]

# Calculate gross pay
sophies_gross_pay = sophies_normal_pay + sophies_overtime_pay

# Calculate net pay
tax_percentage = 20.0
sophies_tax = tax_percentage / 100 * sophies_gross_pay
sophies_net_pay = sophies_gross_pay - sophies_tax 

puts %{Sophie's pay:
  normal:   #{sophies_normal_pay}
  overtime: #{sophies_overtime_pay}
  gross:    #{sophies_gross_pay}
  net:      #{sophies_net_pay}
}