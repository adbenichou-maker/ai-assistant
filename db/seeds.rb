puts "Cleaning database..."
Recipe.destroy_all
User.destroy_all
puts "Creating user..."
user = User.create!(
  email: "test@example.com",
  password: "password123",
  username: "testuser"
)
puts "Creating recipes..."
Recipe.create!(
  title: "Test Lasagna",
  prep_time: 15,
  cooking_time: 45,
  ingredients: "Pasta sheets, tomato sauce, minced meat, cheese",
  description: "A simple test recipe to check the show page.",
  steps: "1. Prep sauce\n2. Layer ingredients\n3. Bake in oven",
  user: user
)
Recipe.create!(
  title: "Creamy Garlic Chicken",
  prep_time: 10,
  cooking_time: 25,
  ingredients: "Chicken breasts, garlic, butter, cream, spinach, salt, pepper",
  description: "A quick and rich garlic chicken dish perfect for weekday dinners.",
  steps: "1. Season chicken\n2. Fry in butter\n3. Add garlic and cream\n4. Simmer with spinach",
  user: user
)
puts "Done seeding!"
