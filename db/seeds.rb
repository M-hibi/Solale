Admin.create!(email: 'admin@admin.solale.jp', password: "#{ENV['SECRET_KEY']}", password_confirmation: "#{ENV['SECRET_KEY']}")

olivia = User.find_or_create_by!(email: "olivia@example.com") do |user|
  user.name = "Olivia"
  user.password = "password"
  user.password_confirmation = "password"
  user.introduction = "Nice to meet you."
end

james = User.find_or_create_by!(email: "james@example.com") do |user|
  user.name = "James"
  user.password = "password"
  user.password_confirmation = "password"
  user.introduction = "Pleased to meet you."
end

lucas = User.find_or_create_by!(email: "lucas@example.com") do |user|
  user.name = "Lucas"
  user.password = "password"
  user.password_confirmation = "password"
  user.introduction = "It’s a pleasure to meet you."
end

Post.create!(
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg"),
  user: olivia
)

Post.create!(
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg"),
  user: james
)

Post.create!(
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg"),
  user: lucas
)

Post.create!(
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post4.jpg"), filename:"sample-post4.jpg"),
  user: olivia
)

Post.create!(
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post5.jpg"), filename:"sample-post5.jpg"),
  user: olivia
)

Post.create!(
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post6.jpg"), filename:"sample-post6.jpg"),
  user: olivia
)

Post.create!(
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post7.jpg"), filename:"sample-post7.jpg"),
  user: olivia
)

Post.create!(
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post8.jpg"), filename:"sample-post8.jpg"),
  user: lucas
)


Post.create!(
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post9.jpg"), filename:"sample-post9.jpg"),
  user: lucas
)


Post.create!(
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post10.jpg"), filename:"sample-post10.jpg"),
  user: lucas
)


Post.create!(
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post11.jpg"), filename:"sample-post11.jpg"),
  user: lucas
)

Post.create!(
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post12.jpg"), filename:"sample-post12.jpg"),
  user: james
)

Post.create!(
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post13.jpg"), filename:"sample-post13.jpg"),
  user: james
)

Post.create!(
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post14.jpg"), filename:"sample-post14.jpg"),
  user: james
)

Post.create!(
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post15.jpg"), filename:"sample-post15.jpg"),
  user: james
)

Post.create!(
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post16.jpg"), filename:"sample-post16.jpg"),
  user: olivia
)

Post.create!(
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post17.jpg"), filename:"sample-post17.jpg"),
  user: olivia
)

Post.create!(
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post18.jpg"), filename:"sample-post18.jpg"),
  user: lucas
)


Post.create!(
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post19.jpg"), filename:"sample-post19.jpg"),
  user: lucas
)


Post.create!(
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post20.jpg"), filename:"sample-post20.jpg"),
  user: lucas
)


Post.create!(
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post21.jpg"), filename:"sample-post21.jpg"),
  user: lucas
)

Post.create!(
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post22.jpg"), filename:"sample-post22.jpg"),
  user: james
)

Post.create!(
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post23.jpg"), filename:"sample-post23.jpg"),
  user: james
)