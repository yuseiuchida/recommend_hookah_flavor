class AimsController < ApplicationController
  before_action :set_aim, only: %i[ show edit update destroy ]

  # GET /aims or /aims.json
  def index
    @aims = Aim.all
  end

  # GET /aims/1 or /aims/1.json
  def show
  end

  # GET /aims/new
  def new
    @aim = Aim.new
  end

  # GET /aims/1/edit
  def edit
  end

  # POST /aims or /aims.json
  def create
    @aim = Aim.new(aim_params)

    respond_to do |format|
      if @aim.save
        format.html { redirect_to aim_url(@aim), notice: "Aim was successfully created." }
        format.json { render :show, status: :created, location: @aim }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @aim.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aims/1 or /aims/1.json
  def update
    respond_to do |format|
      if @aim.update(aim_params)
        format.html { redirect_to aim_url(@aim), notice: "Aim was successfully updated." }
        format.json { render :show, status: :ok, location: @aim }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @aim.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aims/1 or /aims/1.json
  def destroy
    @aim.destroy

    respond_to do |format|
      format.html { redirect_to aims_url, notice: "Aim was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aim
      @aim = Aim.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def aim_params
      params.require(:aim).permit(:option1, :option2, :option3, :option4, :option5)
    end
end
