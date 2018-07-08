# Implement the create action in your mini-capstone. (Note: make sure your `protect_from_forgery` in your `application_controller.rb` is set to `:null_session`)
# Create a frontend test script to test your create action.
# Bonus: Instead of hard coding parameter values in the script, prompt the user to enter each value to send in the parameters.

require 'unirest'

# Create Action
# p "What is the name of the product?"
# input_name = gets.chomp
# p "What is the cost?"
# input_price = gets.chomp.to_i
# p "What is the description?"
# input_description = gets.chomp
# p "What is the image?"
# input_image = gets.chomp

# response = Unirest.post("localhost:3000/api/products",
#   parameters: {
#     input_name: input_name,
#     input_price: input_price,
#     input_description: input_description,
#     input_image: input_image
#   }
# )
# p response.body

# Update Action
#   p "Which product would you like to update?"
#   product_id = gets.chomp
# #

  # response = Unirest.patch("localhost:3000/api/products/#{product_id}",
    # parameters: {
      # input_name: @input_name,
      # input_price: @input_price,
      # input_description: gets.chomp,
      # input_image: @input_image
    # }
  # )

  # p response.body

  #Destroy Action
  p "Which product would you like to delete?"
  product_id = gets.chomp
  response = Unirest.delete("localhost:3000/api/products/#{product_id}")

  p response.body