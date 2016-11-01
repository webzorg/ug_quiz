require 'test_helper'

class Professors::StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @professors_student = professors_students(:one)
  end

  test "should get index" do
    get professors_students_url
    assert_response :success
  end

  test "should get new" do
    get new_professors_student_url
    assert_response :success
  end

  test "should create professors_student" do
    assert_difference('Professors::Student.count') do
      post professors_students_url, params: { professors_student: { email: @professors_student.email, name: @professors_student.name, password: @professors_student.password, student_id: @professors_student.student_id } }
    end

    assert_redirected_to professors_student_url(Professors::Student.last)
  end

  test "should show professors_student" do
    get professors_student_url(@professors_student)
    assert_response :success
  end

  test "should get edit" do
    get edit_professors_student_url(@professors_student)
    assert_response :success
  end

  test "should update professors_student" do
    patch professors_student_url(@professors_student), params: { professors_student: { email: @professors_student.email, name: @professors_student.name, password: @professors_student.password, student_id: @professors_student.student_id } }
    assert_redirected_to professors_student_url(@professors_student)
  end

  test "should destroy professors_student" do
    assert_difference('Professors::Student.count', -1) do
      delete professors_student_url(@professors_student)
    end

    assert_redirected_to professors_students_url
  end
end
