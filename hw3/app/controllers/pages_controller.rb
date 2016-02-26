class PagesController < ApplicationController

  def home()
    @cats = Cat.all
    @users = User.all
    @todos = Todo.all
    @incomplete = Todo.where finished: false
    @complete = Todo.where finished: true
  end

end
