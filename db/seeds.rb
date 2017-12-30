# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者ユーザ
# user = User.new
# user.email = "admin@example.com"
# user.username = "admin"
# user.password = "password"
# user.password_confirmation = "password"
# user.admin = true
# user.save!
User.create(
  email: "admin@example.com",
  username: "admin",
  password: "password",
  password_confirmation: "password",
  admin: true
)

# 一般ユーザ
(1..10).each do |n|
  User.create(
    email: "example#{n}@example.com",
    username: "user#{n}",
    password: "password",
    password_confirmation: "password",
  )
end

<<<<<<< HEAD
# グループ
(1..2).each do |n|
  Group.create(
    name: "group#{n}",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip",
    password: "password",
    password_confirmation: "password",
    user: User.order("RANDOM()").first,
  )
end

# ユーザをグループに所属させる
User.all.each do |user|
  user.update(
    group: Group.order("RANDOM()").first
  )
end

=======
>>>>>>> 103b105bc44b0357e92a0cc86c13598c2a52666c
# 日報
(10..11).each do |month|
  (1..30).each do |day|
    Report.create(
      date: "2017-#{month}-#{day}",
      content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      user: User.order("RANDOM()").first,
    )
  end
end

# コメント
Report.all.each do |report|
  rand(5).times do
    Comment.create(
      content: "hello from seed",
      report: report,
      user: User.order("RANDOM()").first,
    )
  end
end
