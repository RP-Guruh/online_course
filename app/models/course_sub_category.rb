class CourseSubCategory < ApplicationRecord
  belongs_to :course_category

  attr_accessor :current_user

  validates :name, presence: { message: "Nama sub kategori wajib diisi" }
  validates :course_category_id, presence: { message: "Parent kategori wajib diisi" }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at",
     "id",
     "name",
     "note"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

  ransacker :created_at do
    Arel.sql("date(created_at)")
  end
end
