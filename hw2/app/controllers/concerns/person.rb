class Person

  def initialize(name, age)
    @nickname = name[0,4]
    @age = age
  end

  def introduce()
    return "Hello, my name is #{nickname()} and I am #{@age} years old."
  end

  def birth_year()
    return Time.now.year - @age.to_i
  end

  def nickname()
    return @nickname
  end

end
