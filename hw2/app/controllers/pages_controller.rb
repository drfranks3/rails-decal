class PagesController < ApplicationController
  def home
    foo = Foobar.new "baz"
    @baz = foo.bar :cat, sat: :dat, dat: :sat
  end

  def stringify
    @text = "You are nothing!"
  end

  def age
  end

  def person
    person = Person.new params[:name], params[:age]
    @person = {intro: person.introduce, year: person.birth_year, nickname: person.nickname}
  end

  def me
  end

end
