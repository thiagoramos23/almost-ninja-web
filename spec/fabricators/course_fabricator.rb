Fabricator(:course, class_name: 'Course::Course') do
  name               'SwiftUI and Combine'
  length             120
  description        'Neste curso você vai aprender como criar um app do zero utilizando SwiftUI e Combine. Vai aprender como alinhar componentes, fazer efeitos e animações, buscar informaçõs em web services utilizando URLSession em conjunto com Combine e muito mais...'
  html_description   <<~LARGE_DESCRIPTION
                       Neste curso você vai aprender como criar um app do zero utilizando <span class="font-bold text-indigo-700">SwiftUI</span> e
                       <span class="font-bold text-indigo-700">Combine</span>.
                       Vai aprender como alinhar componentes, fazer efeitos e animações, buscar informaçõs em web services
                       utilizando <span class="font-bold text-indigo-700">URLSession</span> em conjunto com <span class="font-bold text-indigo-700">Combine</span> e muito mais...
                     LARGE_DESCRIPTION
  total_classes      6
  total_repositories 1
  learning_subjects  'SwiftUI,SwiftUI Stacks,Combine,URLSessions,Animations'
  needed_knowledge   'Básico de Swift,Básico de Xcode'
  intro_video_url    'https://www.youtube.com/embed/DBq7E1rF1P0?rel=0&autoplay=0'
end
