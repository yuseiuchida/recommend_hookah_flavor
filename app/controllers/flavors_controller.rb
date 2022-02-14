class FlavorsController < ApplicationController
  before_action :set_flavor, only: %i[ show edit update destroy ]

  # GET /flavors or /flavors.json
  def index
    @flavors = Flavor.all
  end

  # GET /flavors/1 or /flavors/1.json
  def show
    @review = Review.new
  end

  # GET /flavors/new
  def new
    @flavor = Flavor.new
    @categories = Category.all
  end

  # GET /flavors/1/edit
  def edit
  end

  # POST /flavors or /flavors.json
  def create
    @flavor = Flavor.new(flavor_params)
    name_array = [flavor_params[:flavor_element_base]]
    flavor_element_option_1 = flavor_params[:flavor_element_option_1]
    flavor_element_option_2 = flavor_params[:flavor_element_option_2]
      if flavor_element_option_1.present?
        name_array << flavor_element_option_1
      end
      if flavor_element_option_2.present?
        name_array << flavor_element_option_2
      end
    @flavor.name = name_array.join(' / ')
    if @flavor.valid?
      @flavor.save
      return redirect_to flavors_path
    else
      render root_path
    end

  end

  # PATCH/PUT /flavors/1 or /flavors/1.json
  def update
    respond_to do |format|
      if @flavor.update(flavor_params)
        format.html { redirect_to flavor_url(@flavor), notice: "Flavor was successfully updated." }
        format.json { render :show, status: :ok, location: @flavor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @flavor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flavors/1 or /flavors/1.json
  def destroy
    @flavor.destroy

    respond_to do |format|
      format.html { redirect_to flavors_url, notice: "Flavor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def bookmarks
    @bookmark_flavors = current_user.bookmark_flavors.order(created_at: :desc)
  end

  def search
    @q = Flavor.search(search_params)
    @flavors = @q.result(distinct: true)
  end

  private
    def set_flavor
      @flavor = Flavor.find(params[:id])
    end

    def flavor_params
      params.require(:flavor).permit(
        :sweet, :refresh, :relax, :body, :flavor_element_base, :flavor_element_option_1, :flavor_element_option_2, { category_ids: []}
        )
    end

    def search_params
      params.require(:q).permit!
    end
end
