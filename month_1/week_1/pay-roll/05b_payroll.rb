sophie = {
  age: 18,
  normal_hours: 8,
  overtime_hours: 3
}

# Set the overtime pay rate to time and a half
$overtime_rate = 1.5
$tax_percentage = 20.0

# Determine Sophie's wage based on National Minimum wage levels
def hourly_rate(age)
  case age
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

sophies_hourly_rate = hourly_rate(sophie[:age])

# Calculate pay for normal working hours
def normal_pay(hourly_rate, hours)
  hourly_rate * hours
end

sophies_normal_pay = normal_pay(sophies_hourly_rate, sophie[:normal_hours])

# Calculate pay for overtime hours
def overtime_pay(hourly_rate, hours)
  hourly_rate * $overtime_rate * hours
end

sophies_overtime_pay = overtime_pay(sophies_hourly_rate, sophie[:overtime_hours])

# Calculate gross pay
def gross_pay(normal_pay, overtime_pay)
  normal_pay + overtime_pay
end

sophies_gross_pay = gross_pay(sophies_normal_pay, sophies_overtime_pay)

# Calculate net pay
def tax(gross_pay)
  $tax_percentage / 100 * gross_pay
end

sophies_tax = tax(sophies_gross_pay)

def net_pay(gross_pay)
  gross_pay - tax(gross_pay)
end

sophies_net_pay = net_pay(sophies_gross_pay)

puts %{Pay for Sophie:
  normal:   #{sophies_normal_pay}
  overtime: #{sophies_overtime_pay}
  gross:    #{sophies_gross_pay}
  net:      #{sophies_net_pay}
}
