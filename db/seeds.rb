# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Professor.create(name: "professor name", professor_id: "123456", email: "professor@professor.com", password: "123456", admin: true)

# Student.destroy_all
Student.create(name: "studentName1", student_id: "923456", email: "user1@student.stu", password: "123456")
Student.create(name: "studentName2", student_id: "823456", email: "user2@student.stu", password: "123456")
Student.create(name: "studentName3", student_id: "723456", email: "user3@student.stu", password: "123456")
