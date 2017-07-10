class Employee
  attr_reader :name, :title, :salary, :boss
  def initialize(name,title,salary,boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    salary * multiplier
  end

  def total_salary
    salary
  end
end

class Manager < Employee
  def initialize(name,title,salary,boss,employees)
    super(name,title,salary,boss)
    @employees = employees
  end

  def bonus(multiplier)

    (total_salary - salary) * multiplier

  end

  def total_salary
    @employees.reduce(0) do |acc,employee|
      acc += employee.total_salary
    end + salary
  end

end
