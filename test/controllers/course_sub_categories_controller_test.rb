require "test_helper"

class CourseSubCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_sub_category = course_sub_categories(:one)
  end

  test "should get index" do
    get course_sub_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_course_sub_category_url
    assert_response :success
  end

  test "should create course_sub_category" do
    assert_difference("CourseSubCategory.count") do
      post course_sub_categories_url, params: { course_sub_category: { course_category_id: @course_sub_category.course_category_id, name: @course_sub_category.name, note: @course_sub_category.note } }
    end

    assert_redirected_to course_sub_category_url(CourseSubCategory.last)
  end

  test "should show course_sub_category" do
    get course_sub_category_url(@course_sub_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_sub_category_url(@course_sub_category)
    assert_response :success
  end

  test "should update course_sub_category" do
    patch course_sub_category_url(@course_sub_category), params: { course_sub_category: { course_category_id: @course_sub_category.course_category_id, name: @course_sub_category.name, note: @course_sub_category.note } }
    assert_redirected_to course_sub_category_url(@course_sub_category)
  end

  test "should destroy course_sub_category" do
    assert_difference("CourseSubCategory.count", -1) do
      delete course_sub_category_url(@course_sub_category)
    end

    assert_redirected_to course_sub_categories_url
  end
end
