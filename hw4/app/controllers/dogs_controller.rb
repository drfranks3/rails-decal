class DogsController < ApplicationController

  def index
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new
  end

  def show
    last = Dog.last
    id = params[:id].to_i
    if Dog.count == 0
      @error = "No dogs in the table!"
    elsif id > last.id
      @error = "ID out of Bounds"
    else
      @dog = Dog.find(id)
    end
    render "index"

  rescue ActiveRecord::RecordNotFound
    @error = "Dog with that ID does not exist"
    render "index"
    
  end

  def create
    @dog = Dog.create(dog_params)
    if @dog.save
      render "index"
    else
      render "new"
    end
  end

  def dog_params
    params.require(:dog).permit(:name, :age)
  end

end
