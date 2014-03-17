class SheepController < ApplicationController
  before_action :set_sheep, only: [:show, :edit, :update, :destroy]

  # GET /sheep
  # GET /sheep.json
  def index
    @sheep = Sheep.all
  end
  def statistics
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title({ :text=>"Prosek jagnjenja za [2014]"})

      
      f.options[:xAxis][:categories] = ['0 kom.', '1 kom.', '2 kom.', '3 kom.', '4 kom.', '5 kom.']
      f.labels(:items=>[:html=>"Broj ovaca po broju ojagnjenih", :style=>{:left=>"40px", :top=>"8px", :color=>"black"} ])      
      # f.series(:type=> 'column',:name=> '2013 prosek 220%',:data=> [2, 17, 26, 22, 4])
      f.series(:type=> 'column',:name=> '2014 prosek 235%',:data=> [1, 13, 32, 27, 6])
      #f.series(:type=> 'spline',:name=> 'Average', :data=> [3, 2.67, 3, 6.33, 3.33])

    end
    
  end

  # GET /sheep/1
  # GET /sheep/1.json
  def show
  end

  # GET /sheep/new
  def new
    @sheep = Sheep.new
  end

  # GET /sheep/1/edit
  def edit
  end

  # POST /sheep
  # POST /sheep.json
  def create
    @sheep = Sheep.new(sheep_params)

    respond_to do |format|
      if @sheep.save
        format.html { redirect_to @sheep, notice: 'Sheep was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sheep }
      else
        format.html { render action: 'new' }
        format.json { render json: @sheep.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sheep/1
  # PATCH/PUT /sheep/1.json
  def update
    respond_to do |format|
      if @sheep.update(sheep_params)
        format.html { redirect_to @sheep, notice: 'Sheep was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sheep.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sheep/1
  # DELETE /sheep/1.json
  def destroy
    @sheep.destroy
    respond_to do |format|
      format.html { redirect_to sheep_index_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sheep
      @sheep = Sheep.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sheep_params
      params.require(:sheep).permit(:code, :mother_id, :father_id, :weight_100_days, :sex, :percent_of_r, :describe, :nickname)
    end
end
