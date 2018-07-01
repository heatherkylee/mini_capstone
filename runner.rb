# Implement the create action in your mini-capstone. (Note: make sure your `protect_from_forgery` in your `application_controller.rb` is set to `:null_session`)
# Create a frontend test script to test your create action.
# Bonus: Instead of hard coding parameter values in the script, prompt the user to enter each value to send in the parameters.

require 'unirest'

# Create Action

# response = Unirest.post("localhost:3000/api/products",
#   parameters: {
#     input_name: "queso",
#     input_price: 10,
#     input_description: "melted goodness",
#     input_image: ""
#   }
# )
# p response.body

# Update Action
  # p "Which product would you like to update?"
  # product_id = gets.chomp


  # response = Unirest.patch("localhost:3000/api/products/#{product_id}",
  #   parameters: {
  #     input_name: gets.chomp
  #   }
  # )

  # p response.body

  #Destroy Action
  # p "Which product would you like to delete?"
  # product_id = gets.chomp
  response = Unirest.delete("localhost:3000/api/products/11")

  p response.body