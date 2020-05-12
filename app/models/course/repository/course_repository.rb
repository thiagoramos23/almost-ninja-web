module Course
  module Repository
    module CourseRepository

      def find_course(id)
        ::Course::Course.find(id)
      end

      def all_available_courses
        courses_with_tags.all.to_a
      end

      def user_registered_courses(user_id)
        courses_with_users
          .where('courses_users.user_id = ?', user_id)
          .all
          .to_a
      end

      def user_already_registered_to_course?(course_id, user_id)
        courses_with_users
          .where('courses.id = ?', course_id)
          .where('users.id = ?', user_id)
          .exists?
      end

      private

      def courses_with_tags
        ::Course::Course.includes(:tags)
      end

      def courses_with_users
        ::Course::Course.joins(:users)
      end
    end
  end
end
