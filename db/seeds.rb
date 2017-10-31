# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者ユーザ
user = User.new
user.email = "admin@example.com"
user.username = "admin"
user.password = "password"
user.password_confirmation = "password"
user.admin = true
user.save!

# 一般ユーザ
10.times do |num|
  user = User.new
  user.email = "example#{num}@example.com"
  user.username = "user#{num}"
  user.password = "password"
  user.password_confirmation = "password"
  user.save!
end

# 日報
1.upto(30) do |day|
  report = Report.new
  report.date = "2017-10-#{day}"
  report.content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  report.user_id = rand(11)+1
  report.save!
end
1.upto(30) do |day|
  report = Report.new
  report.date = "2017-9-#{day}"
  report.content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  report.user_id = rand(11)+1
  report.save!
end

# コメント
Report.all.each do |report|
  rand(5).times do
    comment = Comment.new
    comment.content = "hello from seed"
    comment.report_id = report.id
    comment.user_id = User.order("RANDOM()").first.id
    comment.save!
  end
end
