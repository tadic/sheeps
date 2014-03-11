class VacinationsController < ApplicationController

  # GET /vacinations
  # GET /vacinations.json
  def index
    @activity =  Activity.where("a_type= 'vakcinacija' OR a_type= 'lecenje'").sort_by{|a| a[:date]}
  end

  # GET /vacinations/1
  # GET /vacinations/1.json
  def show
    @activity = Activity.find(params[:id])
  end

  # GET /vacinations/new
  def new
    @vacination = Vacination.new
    @sheeps = Sheep.all
  end

  # GET /vacinations/1/edit
  def edit
    @vacination = Vacination.new
    @sheeps = Sheep.all
    @activity = Activity.find(params[:id])
  end
  
  def desrtoy_activity(id)
      activity = Activity.find_by id: id
      if activity!=nil
        activity.destroy    #desrtoing edited activity and all lambing_childs
      end
  end
  
  def params_are_empty(sheeps)
    if sheeps==nil   
      @vacination = Vacination.new
      respond_to do |format|
          format.html { render action: 'new', notice: 'Nista nije snimljeno posto nije ni uneto!' }
      end
      return true
    end
    return false
  end

  # POST /vacinations
  # POST /vacinations.json
  def create
    sheeps = params[:sheeps]
    return if params_are_empty(sheeps)

    desrtoy_activity(params[:activity_id])
    @activity = Activity.new date: convert_date_to_i(params[:date]), comment: params[:comment], a_type: params[:type_of_a], total_costs:params[:total_costs]

    sheeps.each do |p|
       @vacination = Vacination.new sheep_id:p[:sheep_id], reason: params[:reason], vaccin_name: params[:vaccin_name]
       @activity.vacinations.push(@vacination)
    end
    
    respond_to do |format|
      if @activity.save
        format.html { redirect_to @vacination, notice: 'Vacination was successfully created.' }
        format.json { render action: 'show', status: :created, location: @vacination }
      else
        format.html { render action: 'new' }
        format.json { render json: @vacination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vacinations/1
  # PATCH/PUT /vacinations/1.json
  def update
    respond_to do |format|
      if @vacination.update(vacination_params)
        format.html { redirect_to @vacination, notice: 'Vacination was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vacination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vacinations/1
  # DELETE /vacinations/1.json
  def destroy
    @vacination = Vacination.find(params[:id])
    @vacination.activity.destroy
    respond_to do |format|
      format.html { redirect_to vacinations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vacination
      @vacination = Vacination.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vacination_params
      params.require(:vacination).permit(:reason, :vaccin_name, :activity_id, :sheep_id, :comment)
    end
end
