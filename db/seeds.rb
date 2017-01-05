# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Professor.create(name: "professor name 1", professor_id: "1234562", email: "professor1@professor.com", password: "123456", admin: true)
Professor.create(name: "professor name 2", professor_id: "2234561", email: "professor2@professor.com", password: "123456", admin: true)
Professor.create(name: "professor name 3", professor_id: "3234562", email: "professor3@professor.com", password: "123456", admin: true)
Professor.create(name: "professor name 4", professor_id: "4234563", email: "professor4@professor.com", password: "123456", admin: true)
Professor.create(name: "professor name 5", professor_id: "5234564", email: "professor5@professor.com", password: "123456", admin: true)
Professor.create(name: "professor name 6", professor_id: "6234565", email: "professor6@professor.com", password: "123456", admin: true)
Professor.create(name: "professor name 7", professor_id: "7234566", email: "professor7@professor.com", password: "123456", admin: true)
Professor.create(name: "professor name 8", professor_id: "8234567", email: "professor8@professor.com", password: "123456", admin: true)
Professor.create(name: "professor name 9", professor_id: "9234568", email: "professor9@professor.com", password: "123456", admin: true)
Professor.create(name: "professor name 0", professor_id: "0234569", email: "professor0@professor.com", password: "123456", admin: true)

Student.create(name: "studentName 1", student_id: "1923456", email: "user1@student.stu", password: "123456")
Student.create(name: "studentName 4", student_id: "4823456", email: "user4@student.stu", password: "123456")
Student.create(name: "studentName 2", student_id: "2723456", email: "user2@student.stu", password: "123456")
Student.create(name: "studentName 8", student_id: "8923456", email: "user8@student.stu", password: "123456")
Student.create(name: "studentName 7", student_id: "7823456", email: "user7@student.stu", password: "123456")
Student.create(name: "studentName 5", student_id: "5723456", email: "user5@student.stu", password: "123456")
Student.create(name: "studentName 6", student_id: "6923456", email: "user6@student.stu", password: "123456")
Student.create(name: "studentName 3", student_id: "3823456", email: "user3@student.stu", password: "123456")
Student.create(name: "studentName 9", student_id: "9723456", email: "user9@student.stu", password: "123456")
Student.create(name: "studentName 0", student_id: "1221256", email: "user0@student.stu", password: "123456")

Semester.create(year: 2017, academicterm: true)

Group.create(group_id: "123456", name: "Main Professor's Group", semester_id: 1, professor_id: 1, student_ids: [1,2,3,4,5,6,7,8,9,10])
Group.create(group_id: "923456", name: "Second Professor's Group", semester_id: 1, professor_id: 2, student_ids: [1,2,3])
