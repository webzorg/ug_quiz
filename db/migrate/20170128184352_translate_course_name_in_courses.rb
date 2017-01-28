class TranslateCourseNameInCourses < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      dir.up do
        Course.create_translation_table!(
          {
            course_name: :string
          }, {
            migrate_data: true
          }
        )
      end

      dir.down do
        Course.drop_translation_table! migrate_data: true
      end
    end
  end
end
