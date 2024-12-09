module ApplicationHelper
  def get_name_category(id)
    CourseCategory.find(id).name
  end
end
