module Course
  module Repository
    module LectureRepository
      def first_course_lecture(course_id)
        all_not_module_lectures_for_course(course_id).first
      end

      def all_course_lectures(course_id)
        all_not_module_lectures_for_course(course_id).to_a
      end

      private

      def all_not_module_lectures_for_course(course_id)
        ::Course::Lecture
          .where(course_id: course_id)
          .where.not(module: nil)
          .order('lecture_order ASC')
      end
    end
  end
end
