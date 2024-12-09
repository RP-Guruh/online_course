require "application_system_test_case"

class CourseSubCategoriesTest < ApplicationSystemTestCase
  setup do
    @course_sub_category = course_sub_categories(:one)
  end

  test "visiting the index" do
    visit course_sub_categories_url
    assert_selector "h1", text: "Course sub categories"
  end

  test "should create course sub category" do
    visit course_sub_categories_url
    click_on "New course sub category"

    fill_in "Course category", with: @course_sub_category.course_category_id
    fill_in "Name", with: @course_sub_category.name
    fill_in "Note", with: @course_sub_category.note
    click_on "Create Course sub category"

    assert_text "Course sub category was successfully created"
    click_on "Back"
  end

  test "should update Course sub category" do
    visit course_sub_category_url(@course_sub_category)
    click_on "Edit this course sub category", match: :first

    fill_in "Course category", with: @course_sub_category.course_category_id
    fill_in "Name", with: @course_sub_category.name
    fill_in "Note", with: @course_sub_category.note
    click_on "Update Course sub category"

    assert_text "Course sub category was successfully updated"
    click_on "Back"
  end

  test "should destroy Course sub category" do
    visit course_sub_category_url(@course_sub_category)
    click_on "Destroy this course sub category", match: :first

    assert_text "Course sub category was successfully destroyed"
  end
end
