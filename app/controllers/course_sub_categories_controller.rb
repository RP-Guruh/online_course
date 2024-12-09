class CourseSubCategoriesController < ApplicationController
  include Pagy::Backend
  before_action :set_course_sub_category, only: %i[ show edit update destroy ]
  before_action :get_category, only: %i[new edit]

  add_breadcrumb "home", :root_path
  add_breadcrumb "course sub category", :course_sub_categories_path

  # GET /course_sub_categories or /course_sub_categories.json
  def index
    @q = CourseSubCategory.ransack(params[:q])
    @course_sub_categories = @q.result(distinct: true).order(id: "DESC")
    unless @course_sub_categories.empty?
      @pagy, @course_sub_categories = pagy(@q.result(distinct: true), items: 10)
    end
    add_breadcrumb "index", course_sub_categories_path
  end

  # GET /course_sub_categories/1 or /course_sub_categories/1.json
  def show
  end

  # GET /course_sub_categories/new
  def new
    @course_sub_category = CourseSubCategory.new
  end

  # GET /course_sub_categories/1/edit
  def edit
  end

  # POST /course_sub_categories or /course_sub_categories.json
  def create
    @course_sub_category = CourseSubCategory.new(course_sub_category_params)

    respond_to do |format|
      if @course_sub_category.save
        format.html { redirect_to @course_sub_category, notice: "Course sub category was successfully created." }
        format.json { render :show, status: :created, location: @course_sub_category }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course_sub_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_sub_categories/1 or /course_sub_categories/1.json
  def update
    respond_to do |format|
      if @course_sub_category.update(course_sub_category_params)
        format.html { redirect_to @course_sub_category, notice: "Course sub category was successfully updated." }
        format.json { render :show, status: :ok, location: @course_sub_category }
        format.turbo_stream
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course_sub_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_sub_categories/1 or /course_sub_categories/1.json
  def destroy
    @course_sub_category.destroy!

    respond_to do |format|
      format.html { redirect_to course_sub_categories_path, status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  def get_category
    @categories = CourseCategory.order(name: "ASC")
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_course_sub_category
    @course_sub_category = CourseSubCategory.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def course_sub_category_params
    params.expect(course_sub_category: [:name, :note, :course_category_id])
  end
end
