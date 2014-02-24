namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(first: "Alex",
                         last: "Jiang",
                         email: "ajiang@andover.edu",
                         password: "admin",
                         password_confirmation: "admin")
    admin.toggle!(:admin)
    User.create!(first: "Example",
                 last: "User",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    99.times do |n|
      first  = Faker::Name.first_name
      last = Faker::Name.last_name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(first: first,
                   last: last,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    
    # exercise = admin.exercises.create!(name: "Sample Exercise", author_id: admin.id)
    
    # users = User.all(limit: 6)
    # 5.times do 
    #   move_string = Faker::Lorem.sentence(4)
    #   users.each { |user| user.solutions.create!(move_string: move_string, user_id: user.id, exercise_id: exercise.id ) }
    # end
  end
end