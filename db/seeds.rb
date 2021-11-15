puts "🌱 Seeding spices..."

# Seed your database here
Trip.create(
    name: "Tokyo 2022",
    budget: 8000,
    participants: "everyone",
    start_date: DateTime.new(2022,5,3),
    end_date: DateTime.new(2022,5,23),
)

puts "✅ Done seeding!"
