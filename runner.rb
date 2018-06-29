# Implement the create action in your mini-capstone. (Note: make sure your `protect_from_forgery` in your `application_controller.rb` is set to `:null_session`)
# Create a frontend test script to test your create action.
# Bonus: Instead of hard coding parameter values in the script, prompt the user to enter each value to send in the parameters.

require 'unirest'

response = Unirest.post("localhost:3000/api/products",
  parameters: {
    input_name: "queso",
    input_price: 10,
    input_description: "melted goodness",
    input_image: ""
  }
)
p response.body

