# defining the employee classes

class Employee #:nodoc:
  attr_reader :name, :email
  def initialize(name, email)
    @name = name
    @email = email
  end
end

class HourlyEmployee < Employee #:nodoc:
  def initialize(name, email, hourly_rate, hours_worked)
    super(name, email)
    @hourly_rate = hourly_rate
    @hours_worked = hours_worked
  end

  def calculate_salary
    @hourly_rate * @hours_worked
  end
end

class SalariedEmployee < HourlyEmployee #:nodoc:
  def initialize(name, email, annual_salary)
    @name = name
    @email = email
    @annual_salary = annual_salary
  end

  def calculate_salary
    @annual_salary / 52
  end
end

class MultiPaymentEmployee < HourlyEmployee #:nodoc:
  def initialize(name, email, hourly_rate, hours_worked, annual_salary)
    super(name, email, hourly_rate, hours_worked)
    @annual_salary = annual_salary
  end

  def calculate_salary
    if @hours_worked > 40
      extra_hours = @hours_worked - 40
      salary = extra_hours * @hourly_rate
    else
      salary = super
    end
    salary + @annual_salary / 52
  end
end

class Payroll #:nodoc:
  def initialize(employees)
    @employees = employees
  end

  def notify_employee

  end

  def pay_employees
    @employees.each do |worker|
      puts "#{worker.name} gets paid #{worker.calculate_salary} this week."
    end
    total = @employees.reduce(0) do|sum, worker|
      sum + worker.calculate_salary
    end
    puts "And the total was #{total}."
  end
end

josh = HourlyEmployee.new('Josh', 'nachoemail@example.com', 35, 50)
nizar = SalariedEmployee.new('Nizar', 'starcraftrulez@example.com', 1_000_000)
ted = MultiPaymentEmployee.new('Ted', 'fortranr0x@example.com', 275, 55, 60_000)
halil = HourlyEmployee.new('Halil', 'halil@example.com', 15, 50)
micaela = HourlyEmployee.new('Micaela', 'mica@example.com', 15, 45)

employees = [josh, nizar, ted, halil, micaela]

payroll = Payroll.new(employees)
payroll.pay_employees
