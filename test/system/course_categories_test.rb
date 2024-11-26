require "application_system_test_case"

class CourseCategoriesTest < ApplicationSystemTestCase
  setup do
    @course_category = course_categories(:one)
  end

  test "visiting the index" do
    visit course_categories_url
    assert_selector "h1", text: "Course categories"
  end

  test "should create course category" do
    visit course_categories_url
    click_on "New course category"

    fill_in "Created by", with: @course_category.created_by
    fill_in "Created by name", with: @course_category.created_by_name
    fill_in "Name", with: @course_category.name
    fill_in "Note", with: @course_category.note
    fill_in "Updated by", with: @course_category.updated_by
    fill_in "Updated by name", with: @course_category.updated_by_name
    click_on "Create Course category"

    assert_text "Course category was successfully created"
    click_on "Back"
  end

  test "should update Course category" do
    visit course_category_url(@course_category)
    click_on "Edit this course category", match: :first

    fill_in "Created by", with: @course_category.created_by
    fill_in "Created by name", with: @course_category.created_by_name
    fill_in "Name", with: @course_category.name
    fill_in "Note", with: @course_category.note
    fill_in "Updated by", with: @course_category.updated_by
    fill_in "Updated by name", with: @course_category.updated_by_name
    click_on "Update Course category"

    assert_text "Course category was successfully updated"
    click_on "Back"
  end

  test "should destroy Course category" do
    visit course_category_url(@course_category)
    click_on "Destroy this course category", match: :first

    assert_text "Course category was successfully destroyed"
  end
end
