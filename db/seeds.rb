puts "Cleaning database..."
Recipe.destroy_all
User.destroy_all

# --- Helper function to generate Markdown content ---
def generate_markdown_content(data)
  markdown = "# #{data[:title]}\n\n"
  markdown += "**Description:** #{data[:description]}\n\n"
  markdown += "**Cooking Time:** #{data[:cooking_time]} minutes\n\n"

  markdown += "## Ingredients\n\n"
  # Format ingredients as a bolded name followed by the amount
  data[:ingredients].each do |name, amount|
    markdown += "- **#{name.to_s.humanize}:** #{amount}\n"
  end

  markdown += "\n## Instructions\n\n"
  # Format steps as an ordered list
  data[:steps].each_with_index do |step, index|
    markdown += "#{index + 1}. #{step}\n"
  end

  markdown
end
# ----------------------------------------------------


puts "Creating user..."
user = User.create!(
  email: "test@example.com",
  password: "password123",
  username: "testuser"
)

puts "Creating 5 Recipes using Carrot, Beetroot, and Botifarra..."

# Recipe 1: Botifarra and Beetroot Hash
recipe_1_data = {
  title: "Botifarra and Beetroot Hash",
  cooking_time: 30,
  description: "A simple, savory hash perfect for brunch or a side dish, concentrating the flavors of the root vegetables and sausage.",
  ingredients: {
    "Botifarra": "1 link (cubed)",
    "Beetroot": "2 large (parboiled, cubed)",
    "Carrot": "2 medium (diced)",
    "Olive oil or butter": "2 tbsp",
    "Salt and pepper": "to taste"
  },
  steps: [
    "In a large skillet, cook the cubed botifarra over medium heat until browned and crispy. Remove and set aside, reserving some fat in the pan.",
    "Add the diced carrot and parboiled beetroot cubes to the pan. Cook, stirring occasionally, until the vegetables are tender and slightly caramelized (about 10-15 minutes).",
    "Return the botifarra to the pan and mix everything together. Season with salt and pepper.",
    "Serve hot."
  ]
}

Recipe.create!(
  content: generate_markdown_content(recipe_1_data),
  title: recipe_1_data[:title], # <-- ADDED: Passes title to satisfy model validation
  user: user
)

# Recipe 2: Sweet & Savory Botifarra Skewers
recipe_2_data = {
  title: "Sweet & Savory Botifarra Skewers",
  cooking_time: 25,
  description: "Quick-grilled botifarra and root vegetables finished with a touch of sweetness and acidity.",
  ingredients: {
    "Botifarra": "1 (cut into 1-inch thick pieces)",
    "Carrots": "3 medium (cut into thick rounds or wedges)",
    "Beetroot": "1 large (pre-cooked, sliced)",
    "Honey or maple syrup": "2 tbsp",
    "Vinegar (balsamic or apple cider)": "1 tbsp",
    "Oil, salt, and pepper": "as needed"
  },
  steps: [
    "Pre-boil or steam the carrot pieces until slightly tender, then toss them with a glaze made of honey, vinegar, and a pinch of salt.",
    "Thread the botifarra and pre-cooked beetroot slices onto skewers (if using).",
    "Grill or pan-fry the botifarra until cooked through. Place the glazed carrots and beetroot on the grill/pan to caramelize.",
    "Serve the skewers alongside the glazed carrots."
  ]
}

Recipe.create!(
  content: generate_markdown_content(recipe_2_data),
  title: recipe_2_data[:title], # <-- ADDED: Passes title to satisfy model validation
  user: user
)

# Recipe 3: Botifarra and Root Vegetable Crumble
recipe_3_data = {
  title: "Botifarra and Root Vegetable Crumble (Savory)",
  cooking_time: 35,
  description: "A cozy casserole combining crumbled sausage and tender root vegetables under a golden topping.",
  ingredients: {
    "Botifarra": "1 (cooked, sliced, and crumbled)",
    "Carrots": "2 medium (diced, parboiled)",
    "Beetroot": "2 medium (diced, parboiled)",
    "Butter": "3 tbsp (for sauce/topping)",
    "Flour": "3 tbsp (for sauce)",
    "Milk or broth": "1 cup",
    "Breadcrumbs": "1/2 cup (for topping)",
    "Salt, pepper, and nutmeg": "to taste"
  },
  steps: [
    "Pre-cook the carrots and beetroot until slightly tender. Mix them with the cooked, crumbled botifarra.",
    "Make a white sauce: Melt butter, whisk in flour, and gradually add milk/broth until thickened. Season well.",
    "Combine the vegetable/sausage mixture with the sauce and pour into a small baking dish.",
    "Top with a mixture of breadcrumbs and a little melted butter or cheese.",
    "Bake at 375°F (190°C) for 15-20 minutes until the topping is golden and bubbly."
  ]
}

Recipe.create!(
  content: generate_markdown_content(recipe_3_data),
  title: recipe_3_data[:title], # <-- ADDED: Passes title to satisfy model validation
  user: user
)

# Recipe 4: Quick Botifarra & Beetroot Tostada
recipe_4_data = {
  title: "Quick Botifarra & Beetroot Tostada",
  cooking_time: 15,
  description: "A fast, fresh, Catalan-inspired tapas dish, pairing savory sausage with a bright root vegetable slaw.",
  ingredients: {
    "Botifarra": "1 (cooked, sliced)",
    "Beetroot": "1 large (cooked, diced)",
    "Carrot": "1 large (raw, grated)",
    "Bread slices": "4 (toasted)",
    "Olive oil": "to drizzle",
    "Vinegar or lemon juice": "1 tsp",
    "Salt and pepper": "to taste"
  },
  steps: [
    "Cook the botifarra and slice it. Toast the bread.",
    "Mix the diced beetroot and grated carrot with olive oil, salt, pepper, and vinegar/lemon juice to create a simple salad/slaw.",
    "Place the sliced botifarra on the toast.",
    "Serve the beetroot and carrot slaw either on top of the sausage or alongside the toast."
  ]
}

Recipe.create!(
  content: generate_markdown_content(recipe_4_data),
  title: recipe_4_data[:title], # <-- ADDED: Passes title to satisfy model validation
  user: user
)

# Recipe 5: Shredded Root Slaw with Warm Botifarra
recipe_5_data = {
  title: "Shredded Root Slaw with Warm Botifarra",
  cooking_time: 20,
  description: "A textural salad using raw root vegetables for maximum crunch, topped with warm, fully-cooked sausage.",
  ingredients: {
    "Botifarra": "1 (cooked, sliced)",
    "Carrots": "2 large (raw, shredded or julienned)",
    "Beetroot": "2 large (raw, shredded or julienned)",
    "Olive oil": "3 tbsp",
    "Lemon juice or vinegar": "1 tbsp",
    "Salt and pepper": "to taste"
  },
  steps: [
    "Shred or julienne the raw carrots and beetroot into thin matchsticks.",
    "Whisk together the olive oil, lemon juice/vinegar, salt, and pepper to create a simple vinaigrette.",
    "Toss the shredded vegetables with the vinaigrette until evenly coated.",
    "Cook the botifarra until fully done and slice it.",
    "Plate the cold, crunchy slaw and top it with the warm, sliced botifarra."
  ]
}

Recipe.create!(
  content: generate_markdown_content(recipe_5_data),
  title: recipe_5_data[:title], # <-- ADDED: Passes title to satisfy model validation
  user: user
)

puts "Done seeding! Created #{Recipe.count} recipes."
