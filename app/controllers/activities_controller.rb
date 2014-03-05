class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  # GET /activities
  # GET /activities.json
  def index
    @activities = Activity.all
    @sheeps = Sheep.all
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
  end

  # GET /activities/new
  def new
    @ac_types = set_ac_types
    @activity = Activity.new
    @sheeps = Sheep.all
  end

  # GET /activities/1/edit
  def edit
        @ac_types = set_ac_types
  end
  def set_ac_types
    ac_types = []
        Activity.types.each do |key, value|
          ac_types.push(key)
        end
    return ac_types
  end
  
 
  
  def convert_date_to_i(date)
    if date.length<9
      return 0
    end
      d = date.at(6..9)
      d += date.at(3..4)
      d += date.at(0..1)
     return d.to_i
  end

def get_time_from
  time = params.require(:activity).permit(:time_from)
  t = time[:"time_from(4i)"]
  t += ':'
  t += t = time[:"time_from(5i)"]
  return t
end
def get_time_to
  time = params.require(:activity).permit(:time_to)
  t = time[:"time_to(4i)"]
  t += ':'
  t += t = time[:"time_to(5i)"]
  return t
end

  # POST /activities
  # POST /activities.json
  def create

    @activity = Activity.new(activity_params)


    @activity.date = convert_date_to_i(params[:date])
    @activity.time_from = get_time_from
    @activity.time_to = get_time_to

    respond_to do |format|
      if @activity.save

        format.html { redirect_to new_lambing_path }
        format.json { render action: 'show', status: :created, location: @activity }
      else
        format.html { render action: 'new' }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:tip, :total_costs, :comment)
    end
end
