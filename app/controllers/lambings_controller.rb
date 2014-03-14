class LambingsController < ApplicationController
  before_action :set_lambing, only: [:update, :destroy]

  # GET /lambings
  # GET /lambings.json
  def index
    @lambings = Activity.where(a_type: 'jagnjenja').sort_by{|a| a[:date]}
    @sheeps = Sheep.all
  end

  # GET /lambings/1
  # GET /lambings/1.json
  def show
      @activity = Activity.find(params[:id])
  end

  # GET /lambings/new
  def new
    @lambing = Lambing.new
    @sheeps = Sheep.ready_for_lambing
  end
   def lambing_sheep_index_path
      lambing_path
  end

  # GET /lambings/1/edit
  def edit
      @lambing = Lambing.new
      @activity = Activity.find(params[:id])
      @sheeps = Sheep.ready_for_lambing
  end

  def are_empty_params(lambings)
     if lambings==nil   
        @lambing = Lambing.new
        @sheeps = Sheep.ready_for_lambing
        respond_to do |format|
          format.html { render action: 'new', notice: 'Nista nije snimljeno posto nije ni uneto!' }
        end
      return true
     end
    return false
  end
  
  def desrtoy_activity(id)
      activity = Activity.find_by id: id
      if activity!=nil
        activity.destroy    #desrtoing edited activity and all lambing_childs
      end
  end
  # POST /lambings
  # POST /lambings.json
  def create
    lambings =  params[:lambings]
    return if are_empty_params(lambings)

    desrtoy_activity(params[:activity_id])
    @activity = Activity.new date: convert_date_to_i(params[:date]), comment: params[:comment], a_type: 'jagnjenja', location: 'farma'

    lambings.each do |l|
        mother = Sheep.find_by code: l[:sheep_code]
        alive = (l[:alive] == 'true')
        lambing = Lambing.new sheep_id:mother.id, is_alive: alive, comment: l[:comment], weight: l[:weight]
        if alive
          lamb = Sheep.new sex:l[:sex], mother_id: mother.id, status:'na farmi', describe: l[:describe]
        else
          lamb = Sheep.new sex:l[:sex], mother_id: mother.id, status:'mrtvo rodjeno', describe: l[:describe]
        end
        lambing.lamb = lamb
        @activity.lambings.push(lambing)
    end
    

    respond_to do |format|
      if @activity.save
        format.html { redirect_to lambings_path, notice: 'Lambing was successfully created.' }
        format.json { render action: 'index', status: :created, location: lambings_path }
      else
        format.html { render action: 'new' }
        format.json { render json: @lambing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lambings/1
  # PATCH/PUT /lambings/1.json
  def update
    raise
  end

  # DELETE /lambings/1
  # DELETE /lambings/1.json
  def destroy
    a = Activity.find(@lambing.activity_id)
    a.destroy
    respond_to do |format|
      format.html { redirect_to lambings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lambing
      @lambing = Lambing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lambing_params
      params.require(:lambing).permit(:date, :sheep_id, :comment, :sex)
    end
end
