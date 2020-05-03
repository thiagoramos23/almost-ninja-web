module Course
  module Repository
    module CourseRepository

      def all_available_courses
        courses_with_tags.all.to_a
      end

      def user_registered_courses(user_id)
        courses_with_tags
          .joins(:users)
          .where('courses_users.user_id = ?', user_id)
          .all
          .to_a
      end

      private

      def courses_with_tags
        ::Course::Course.includes(:tags)
      end
    end
  end
end
