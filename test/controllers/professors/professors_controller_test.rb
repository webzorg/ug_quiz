require 'test_helper'

class Professors::ProfessorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @professors_professor = professors_professors(:one)
  end

  test "should get index" do
    get professors_professors_url
    assert_response :success
  end

  test "should get new" do
    get new_professors_professor_url
    assert_response :success
  end

  test "should create professors_professor" do
    assert_difference('Professors::Professor.count') do
      post professors_professors_url, params: { professors_professor: { email: @professors_professor.email, name: @professors_professor.name, password: @professors_professor.password, professor_id: @professors_professor.professor_id } }
    end

    assert_redirected_to professors_professor_url(Professors::Professor.last)
  end

  test "should show professors_professor" do
    get professors_professor_url(@professors_professor)
    assert_response :success
  end

  test "should get edit" do
    get edit_professors_professor_url(@professors_professor)
    assert_response :success
  end

  test "should update professors_professor" do
    patch professors_professor_url(@professors_professor), params: { professors_professor: { email: @professors_professor.email, name: @professors_professor.name, password: @professors_professor.password, professor_id: @professors_professor.professor_id } }
    assert_redirected_to professors_professor_url(@professors_professor)
  end

  test "should destroy professors_professor" do
    assert_difference('Professors::Professor.count', -1) do
      delete professors_professor_url(@professors_professor)
    end

    assert_redirected_to professors_professors_url
  end
end
