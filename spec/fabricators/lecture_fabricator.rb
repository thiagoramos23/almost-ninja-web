Fabricator(:lecture, class_name: 'Course::Lecture') do
  video_url           'https://www.youtube.com/embed/DBq7E1rF1P0?rel=0&autoplay=0'
  video_thumbnail_url 'https://img.youtube.com/vi/DBq7E1rF1P0/0.jpg'
  description         'First'
  title               'Intro'
  lecture_order       1
  course
end
