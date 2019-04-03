=begin

Payroll

We've seen how methods are used to encapsulate functionality. In this exercise we'll see what effect this has on the code we write; in particular how we can avoid complexity and repetition in our code. 

On the left, you can see the beginnings of some code that calculates the payroll for an organisation. Notice that currently this code is 'loose' Ruby code that is not encapsulated into any method. The code will be run sequentially from top to bottom, defining some data about an employee, calculating her daily rate and then calculating her pay based on the numbers of hours she has worked, less some tax she owes.

On the face of it, there isn't much wrong with this code. It is clear and easy to read. However, on closer inspection we might observe the following issues:

While the code is logical in the order that it progresses, and shows all of it's working, there isn't  anything to group it together; hence the author has used liberal use of comments to mark the start and end of each section.
The code mentions the employee's name sophie a lot in the code. Since there isn't anything to group this code together, the author tried to emphasise that this data pertains to the same person through repetition of the employee's name in the variables. Without such naming, we'd have variables such as normal_pay, overtime_pay and so on; but it wouldn't necessarily be clear whom these bits of data belonged to.
Assuming that the organisation has multiple employees or intends to hire more in future, this code is currently very much centered on Sophie. If we added Tom to our code, we'd need to copy and paste all of the calculations we'd made, so we'd have duplicate sections for finding the appropriate wage level, calculating the gross pay and the net pay. This repetition is undesirable for many reasons: it increases maintenance overhead and scope for error; but most importantly it makes this code harder to change. The harder code is to change, the less re-useable and extensible it is. 
We rely on some numbers in our calculations, such as the overtime_rate and the tax_percentage, both of which are hard-coded numbers. If we needed to charge a different rate of tax, we'd need to change the variable for the given employee. This is another example of where we'd need to alter our code when the inputs change.

The main takeaway from this is that this code is too rigid and would be difficult to extend if we added more employees. Just imagine if we had 100 employees on the payroll- these 34 lines would become 3,400  lines!

Using methods
To combat this problem, we can use methods to encapsulate functionality into re-useable chunks, each with a specific purpose, such as performing one calculation. We can then piece these methods together, so that we preserve the steps that we make for each employee to calculate their pay; but we will make each employee an input to a method, so that we can re-use the same steps for different employees.

When looking for methods to refactor, we can look through our code for tasks that we are performing that we can define separately from the others. From reading the code, and particularly the comments, we can see that given an input (Sophie), we perform the following steps:

Determine Sophie's wage based on National Minimum wage levels
Set the overtime pay rate to time and a half
Calculate pay for normal working hours
Calculate pay for overtime hours
Calculate gross pay
Calculate net pay

These steps culminate into a single result that is Sophie's net pay. Another way of thinking about this is to group steps 1-6 above into a method, which takes an input (an employee, e.g. Sophie) and returns an output (net pay). Let's see how encapsulating this into a method will help us to refactor our code and make it more reusable. 

Defining a net_pay method
Let's go ahead and define the net_pay method. Wrap all of the code between lines 7 though to the end of the file into a method called net_pay. By defining this method, we simplify the overall code in the file to two steps: defining a hash called sophie and defining a method called net_pay. Don't forget that until we call the net_pay method, we won't see the output (56.0) displayed any longer in the terminal. Underneath your new method, be sure to call it by putting it on it's own line:

puts net_pay

When you run the code again, you ought to see the following error:

payroll.rb:9:in `net_pay': undefined local variable or method `sophie' for main:Object (NameError)

This is because now that we've encapsulated our code into a method, the sophie variable is out of scope. This is deliberate, because we want to treat our methods like black boxes, that take a discrete list of inputs, rather than relying on global variables co-incidentally being in scope. 

To fix the problem, we need to pass sophie back in as an argument. Consider the options available from the deck- how could we pass in an argument? In this case a named argument is probably fine, so let's add an argument to the net_pay method.

puts net_pay(sophie)

This should fix the problem and display the output again. However, this is a good opportunity to make our code more general by considering an employee rather than hard-coding the input to be sophie. This advertises to other developers that this method ought to work for any employee hash, and is not intended just for sophie.

Refactor your code so that we remove the direct references to sophie, and rename any variables that start with sophie_ to remove that prefix. Notice how much easier the code is to read, and how the code would now make sense for any employee input, provided the employee argument is a hash.

2. The hourly_pay method
Although we've got a net_pay method, we can see that this method is still performing multiple tasks. Each of these tasks, currently denoted by comments, could be candidates for new methods, each of which is performing one task. If we repeat the process above, we could potentially write methods for each step, passing in the required information as an argument. 

Let's start with the first step of calculating the pay. Here we're setting an hourly_rate variable to the result of a case statement, where we're using the employee's age to determine the rate of pay. One of the nice things about Ruby is that the syntax for a local variable and a method are effectively the same; so if we refactor the case statement into a method, we don't need to change any of the other code in net_pay,  because everywhere we previously refer to hourly_rate will now call the new method, rather than the local variable. 

The other nice side effect of this is that we don't need the variable assignment within the hourly_rate method, because of the design feature in Ruby that the last statement is the value of the method. Once we're done, we ought to end up with a method like this:

def hourly_rate(employee)
  case employee[:age]
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

This method is now very self-explanatory, so the comment is redundant. It is re-useable, because it would work for any employee, not just Sophie, and it is extensible, because if we wanted to support another age band all we'd need to do is add another when clause to the case statement.

Next steps
Continue to find methods to refactor, so that all of the code is neatly encapsulated. Here are the list of methods required to pass the unit tests for this exercise. Attempt them one by one and make sure your code still works! Be careful of the wrong number of argument errors, making sure to pass the correct arguments to your new methods.

net_pay
hourly_rate
normal_pay
overtime_pay
gross_pay
tax

By that point,  you ought to have several, short methods that perform one job. You shouldn't need to use comments, as the methods have become self-explanatory.

Advanced: Objects
If you've read ahead to the objects and classes lesson, you might notice that instead of passing the employee reference around everywhere, it would be great if we encapsulated all of these methods into an Employee class, that referred to the data within itself, which would simplify the methods we've written here. See if you can refactor this into an object, so that we could write the following code:

sophie = Employee.new({
  age: 18,
  normal_hours: 8,
  overtime_hours: 3
})
puts sophie.net_pay

=end