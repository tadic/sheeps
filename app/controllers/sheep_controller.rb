class SheepController < ApplicationController
  before_action :set_sheep, only: [:show, :edit, :update, :destroy]
  before_action :check_current_user, only: [:new, :edit, :destroy, :index, :show, :statistics, :sheeplist]
  
  include ActionView::Helpers::NumberHelper # <-
  # GET /sheep
  # GET /sheep.json
  def index
    @sheep = Sheep.all
  end
  def sheeplist
  end
  
  def statistics
    bs = Sheep.best_sheep(5)
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title({ :text=>"Jagnjenja u [2014]"})  
      f.options[:xAxis][:categories] = ['1', '2', '3', '4', '5', '6']
      f.options[:yAxis][:title] = {text: 'broj ovaca (kom.)'  }
      f.options[:xAxis][:title] = {text: 'broj jaganjaca po ovci (kom.)'  }
      f.labels(:items=>[:html=>""+Lambing.count.to_s+" jagnjenjadi iz "+number_of_lambings.to_s+" jagnjenja: " + average_lambings.to_s + "%", :style=>{:left=>"20px", :top=>"4px", :color=>"green"} ])      
      # f.series(:type=> 'column',:name=> '2013 prosek ' + average_lambings.to_s,:data=> [2, 17, 26, 22, 4])
      f.series(:type=> 'column',:name=> 'broj ovaca',:data=> [l_find(1), l_find(2), l_find(3), l_find(4), l_find(5), l_find(6)])
      #f.series(:type=> 'spline',:name=> 'Average', :data=> [3, 2.67, 3, 6.33, 3.33])
    end
    @chart2 = LazyHighCharts::HighChart.new('graph') do |f|
      f.title({ :text=>"Broj grla na farmi u [2014]"})  
      f.options[:xAxis][:categories] = ['jan', 'feb', 'mar', 'apr', 'maj', 'jun', 'jul', 'avg', 'sep', 'okt', 'nov', 'dec']
      f.options[:yAxis][:title] = {text: 'broj grla (kom.)'  }
      # f.series(:type=> 'column',:name=> '2013 prosek ' + average_lambings.to_s,:data=> [2, 17, 26, 22, 4])
      #f.series(:type=> 'column',:name=> '2014 prosek ' + average_lambings.to_s + '%',:data=> [l_find(1), l_find(2), l_find(3), l_find(4), l_find(5), l_find(6)])
      f.series(:type=> 'spline',:name=> 'Trenutno stanje:', :data=> sheeps_number_in_time, :color=> 'red')
    end
    @chart3 = LazyHighCharts::HighChart.new('graph') do |f|
      f.title({ :text=>"Najbolje ovce"})  
      f.options[:xAxis][:categories] = [bs[0].nickname, bs[1].nickname, bs[2].nickname, bs[3].nickname, bs[4].nickname]
      f.options[:yAxis][:title] = {text: 'prosek jagnjenja u %' }
      f.options[:xAxis][:title] = {text: 'naziv ovce' }
      f.series(:type=> 'bar',:name=> 'Procenat jagnjenja',
               :data=> [bs[0].percent_of_lambings, bs[1].percent_of_lambings, bs[2].percent_of_lambings, bs[3].percent_of_lambings, bs[4].percent_of_lambings])
    end
    c = costs_in_time
    m = many_in_time
    @chart4 = LazyHighCharts::HighChart.new('graph') do |f|
      f.title({ :text=>"Rashodi/Prihodi"})  
      f.options[:xAxis][:categories] = ['jan', 'feb', 'mar', 'apr', 'maj', 'jun', 'jul', 'avg', 'sep', 'okt', 'nov', 'dec']
      f.options[:yAxis][:title] = {text: 'iznos u evrima' }
      f.options[:xAxis][:title] = {text: '2014' }
      f.series(:type=>'column', :name=> 'Rashodi',
               :data=> c)
      f.series(:type=>'column', :name=> 'Prihodi',
               :data=> m,  color: 'green')

    end
    sr = starosna_raspodela
    @chart5 = LazyHighCharts::HighChart.new('graph') do |f|
      f.title({ :text=>"Starost zenskih odraslih ovaca"})  
      f.options[:xAxis][:categories] = ['0 god.', '1 god.', '2 god.', '3 god.', '4 god.', '5 god.', '6 god.', '7 god.', '8 god.', '9 god.']
      f.options[:yAxis][:title] = {text: 'broj ovaca (kom.)'  }
      f.options[:xAxis][:title] = {text: 'starost (god.)'  }
      f.labels(:items=>[:html=>"Prosecna starost " + average_age + " god.", :style=>{:left=>"20px", :top=>"4px", :color=>"green"} ])      
      # f.series(:type=> 'column',:name=> '2013 prosek ' + average_lambings.to_s,:data=> [2, 17, 26, 22, 4])
      f.series(:type=> 'column',:name=> 'borj ovaca',:data=> sr)
    end
    bl = Sheep.best_female_lambs(5)
    @chart6 = LazyHighCharts::HighChart.new('graph') do |f|
      f.title({ :text=>"Najbolji zenski jaganjci"})  
      f.options[:xAxis][:categories] = [bl[0].code_nickname, bl[1].code_nickname, bl[2].code_nickname, bl[3].code_nickname, bl[4].code_nickname]
      f.options[:yAxis][:title] = {text: 'iz legla od' }
      f.series(:type=> 'bar',:name=> 'velicina legla (kom.)',
               :data=> [{y: bl[0].lambs_from_lambing, color: 'red'}, {y: bl[1].lambs_from_lambing, color: 'green'},
                        {y: bl[2].lambs_from_lambing, color: 'black'}, bl[3].lambs_from_lambing,
                        {y: bl[4].lambs_from_lambing, color: 'orange'}])
    end
  end
  
  def starosna_raspodela
    arr = [0,0,0,0,0,0,0,0,0,0]
    sheeps = Sheep.all
    sheeps.each do |s|
      if s.sex=='zensko' and s.age_in_months > 6 and s.age_in_months < 100
        arr[(s.age_in_months/12).to_i] += 1
      end
    end
    return arr
  end
  def average_age
    sum = 0
    age = 0
    num = 0
    arr = starosna_raspodela
    arr.each do |s|
      sum += age*s
      age += 1
      num += s
    end
    return number_with_precision((sum.to_f/num).to_f, precision: 2)
  end

def average_lambings
  return number_with_precision((100*Lambing.all.count.to_f/number_of_lambings).to_f, precision: 2)
end



def number_of_lambings
  Lambing.find(:all, :select => "activity_id, sheep_id, count(*) AS count", :group => "activity_id, sheep_id").count
end

def l_find(n)
  @lambings = Lambing.find(:all, :select => "activity_id, sheep_id, count(*) AS count", :group => "activity_id, sheep_id")
  return  @lambings.select { |l| l.count == n }.count
end
  # GET /sheep/1
  # GET /sheep/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ReportPdf.new(@sheep)
        send_data pdf.render, filename: 'sheep.pdf', type: 'application/pdf'

      end
    end
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
