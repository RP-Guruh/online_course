class CourseCategory < ApplicationRecord
  attr_accessor :current_user

  before_create :set_user_save
  before_save :set_user_update

  validates :name, presence: { message: "Nama kategori wajib diisi" }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at",
     "id",
     "name",
     "updated_at",
     "created_by_name",
     "updated_by_name"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

  ransacker :created_at do
    Arel.sql("date(created_at)")
  end

  private

  def set_user_save
    if current_user
      self.created_by = current_user.id
      self.created_by_name = current_user.email
    end
  end

  def set_user_update
    if current_user
      self.updated_by = current_user.id
      self.updated_by_name = current_user.email
    end
  end
end
