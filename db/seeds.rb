# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = ::User.create!(email: 'test@example.com')
::Account.create!(email: 'test@example.com', password: 'testtesttest', password_confirmation: 'testtesttest', user: user)
course = ::Course.create!(
  name:               'SwiftUI and Combine', 
  lenght:             120, 
  description:        'Learn iOS using SwiftUI with Combine and embrace the power of the new Apple UI Framework',
  total_classes:      6,
  total_repositories: 1,
  learning_subjects:  'SwiftUI,SwiftUI Stacks,Combine,URLSessions,Animations',
  needed_knowledge:   'Básico de Swift,Básico de Xcode'
)
course.users << user
course.tags.create(name: 'swiftUI')
course.tags.create(name: 'combine')
course.tags.create(name: 'apple')
