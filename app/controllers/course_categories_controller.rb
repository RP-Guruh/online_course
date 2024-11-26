class CourseCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course_category, only: %i[ show edit update destroy ]

  add_breadcrumb "home", :root_path
  add_breadcrumb "course category", :course_categories_path

  # GET /course_categories or /course_categories.json
  def index
    @course_title = "Course Category List"
    @q = CourseCategory.ransack(params[:q])
    @course_categories = @q.result(distinct: true)
    add_breadcrumb "index", course_categories_path
  end

  # GET /course_categories/1 or /course_categories/1.json
  def show
  end

  # GET /course_categories/new
  def new
    @course_category = CourseCategory.new
  end

  # GET /course_categories/1/edit
  def edit
  end

  # POST /course_categories or /course_categories.json
  def create
    @course_category = CourseCategory.new(course_category_params)

    respond_to do |format|
      if @course_category.save
        format.html { redirect_to @course_category, notice: "Course category was successfully created." }
        format.json { render :show, status: :created, location: @course_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_categories/1 or /course_categories/1.json
  def update
    respond_to do |format|
      if @course_category.update(course_category_params)
        format.html { redirect_to @course_category, notice: "Course category was successfully updated." }
        format.json { render :show, status: :ok, location: @course_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_categories/1 or /course_categories/1.json
  def destroy
    @course_category.destroy!

    respond_to do |format|
      format.html { redirect_to course_categories_path, status: :see_other, notice: "Course category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course_category
    @course_category = CourseCategory.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def course_category_params
    params.expect(course_category: [:name, :note, :created_by, :created_by_name, :updated_by, :updated_by_name])
  end
end
