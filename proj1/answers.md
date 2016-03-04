# Q0: Why is this error being thrown?
We have not created a Pokemon controller. The Home controller is trying to access a file and
data that does not exist.

# Q1: How are the random Pokemon appearing? What is the common factor between all the possible Pokemon that appear? *
When the home page is loaded, Pokemon that are trainerless are stored in a variable. The controller then "samples" (i.e. selects a Pokemon at random from the trainerless ones) and stores the data in @pokemon

# Question 2a: What does the following line do "<%= button_to "Throw a Pokeball!", capture_path(id: @pokemon), :class => "button medium", :method => :patch %>"? Be specific about what "capture_path(id: @pokemon)" is doing. If you're having trouble, look at the Help section in the README.
This creates an HTML form with the action directed to the capture path of the Pokemon controller. It also passesthe `id` parameter the value of the Pokemon's ID. It then creates a button with the classes `button` and `medium`and specifies that the method of the form should be a `patch`.

# Question 3: What would you name your own Pokemon?
Nugget.

# Question 4: What did you pass into the redirect_to? If it is a path, what did that path need? If it is not a path, why is it okay not to have a path here?
I passed `:back` to the redirect_to to bring the user back to the page where the Pokemon was encountered.

# Question 5: Explain how putting this line "flash[:error] = @pokemon.errors.full_messages.to_sentence" shows error messages on your form.
`@pokemon.errors` retrieves all validation errors from the pokemon controller, the `full_messages` method
returns all the errors in the array and `to_sentence` formats the errors nicely. The view then displays the
values passed to the `flash` object under the `errors` key.

# Give us feedback on the project and decal below!
I really enjoy this DeCal! Although I think we go fairly quickly, it's at a comfortable speed.

# Extra credit: Link your Heroku deployed app
