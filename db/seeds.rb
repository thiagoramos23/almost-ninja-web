# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

course_html_description = <<~LARGE_DESCRIPTION
Neste curso você vai aprender como criar um app do zero utilizando <span class="font-bold text-indigo-700">SwiftUI</span> e
<span class="font-bold text-indigo-700">Combine</span>.
Vai aprender como alinhar componentes, fazer efeitos e animações, buscar informaçõs em web services
utilizando <span class="font-bold text-indigo-700">URLSession</span> em conjunto com <span class="font-bold text-indigo-700">Combine</span>.
Espero que você saia desse curso como um Quase Ninja em Swift
LARGE_DESCRIPTION
::ActiveRecord::Base.transaction do
  user = ::Identity::User.create!(email: 'thiagoramos.al@example.com')
  ::Account.create!(email: 'thiagoramos.al@example.com', password: '123123123', password_confirmation: '123123123', user: user)
  course = ::Course::Course.create!(
    name:               'SwiftUI and Combine',
    length:             120,
    description:        'Learn iOS using SwiftUI with Combine and embrace the power of the new Apple UI Framework',
    html_description:   course_html_description,
    total_lectures:      6,
    total_repositories: 1,
    learning_subjects:  'SwiftUI,SwiftUI Stacks,Combine,URLSessions,Animations',
    needed_knowledge:   'Básico de Swift,Básico de Xcode',
    intro_video_url:    'https://www.youtube.com/embed/DBq7E1rF1P0?rel=0&autoplay=0'
  )
  course.users << user
  course.tags.create(name: 'swiftUI')
  course.tags.create(name: 'combine')
  course.tags.create(name: 'apple')
end
