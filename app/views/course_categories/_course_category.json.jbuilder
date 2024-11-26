json.extract! course_category, :id, :name, :note, :created_by, :created_by_name, :updated_by, :updated_by_name, :created_at, :updated_at
json.url course_category_url(course_category, format: :json)
