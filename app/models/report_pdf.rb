class ReportPdf < Prawn::Document
  def initialize(sheep)
    super()
    @sheep = sheep
    title
    content
    footer
  end
 def title
      bounding_box([30, 690], :width => 270) do
        text "Grlo: '"+@sheep.nickname.to_s+"', oznaka: <color rgb='ff0000'>"+@sheep.code.to_s+"</color>", size: 18, :inline_format => true
        text  "<color rgb='ff0000'>"+@sheep.sex.to_s+"</color>"+ ", " + @sheep.percent_of_r.to_s + "% romanov", size: 16, :inline_format => true
        text "Status: " +@sheep.status.to_s+ " ", :color => "009900", size: 16
      end
 end
 def birth(y_position)
    y_position = cursor - 50
    # The bounding_box takes the x and y coordinates for positioning its content and some options to style it
    bounding_box([30, y_position], :width => 270) do
      text "Rodjena dana " + @sheep.birth_date, size: 15, style: :bold
      text "  -  Mesto rodjenja:      " + @sheep.birth_place
      text "  -  Tezina na rodjenju:  " + @sheep.birthweight
      text "  -  Opis grla:           " + @sheep.describe
    end
 end
 
 def vacinations(y_position)
      bounding_box([300, y_position], :width => 270) do
          if @sheep.self_vacinations.count == 0
             text "Preventive nije bilo", size: 15, style: :bold
          else
            text "Preventiva", size: 15, style: :bold
            table_content(vacinations_rows)
          end
      end
 end
 
 def lambings(y_position)
      bounding_box([30, y_position], :width => 270) do
          if @sheep.lambings.count == 0
             text "Jagnjenja nije bilo", size: 15, style: :bold
          else
            text "Na farmi se jagnjila " + @sheep.lambing_activities.count.to_s + " puta - "+ @sheep.percent_of_lambings.to_s + '%', size: 15, style: :bold
            table_content(lambings_rows)
          end
      end
 end
 
 def selling(y_position)
   if @sheep.sheep_selling != nil
          bounding_box([30, y_position], :width => 270) do

             text "Prodato " + @sheep.sheep_selling.activity.show_date + ' ' + @sheep.sheep_selling.price.to_s + ' evra', size: 15, style: :bold, :color => "009900"
             text "    -  tezina:      " + @sheep.sheep_selling.weight.to_s + "kg"
          end
   end
 end
  
 def terapies(y_position)
      bounding_box([300, y_position], :width => 270) do
          if @sheep.terapies.count == 0
             text "Lecenja nije bilo", size: 15, style: :bold
          else
            text "Grlo je leceno " + @sheep.terapies.count + " puta", size: 15, style: :bold
            table_content(terapies_rows)
          end
      end
 end

  def purchase(y_position)
    if @sheep.sheep_purchase!=nil
      bounding_box([30, y_position], :width => 270) do
          text "Nabavljena " +  @sheep.sheep_purchase.activity.show_date, size: 15, style: :bold
          text "  -  Mesto:               " + @sheep.sheep_purchase.activity.location
          text "  -  Cena:                " + @sheep.sheep_purchase.price.to_s
          text "  -  Napomena:            " + @sheep.sheep_purchase.comment
      end
    end
  end
 
  def tree
      bounding_box([313, 700], :width => 100, :height => 30) do
          text "Majka", size: 12, :align => :center, :valign => :center
      end
      bounding_box([418, 700], :width => 100, :height => 30) do
          text "Otac", size: 12, :align => :center, :valign => :center
      end
      bounding_box([323, 673], :width => 80, :height => 30) do
          text  @sheep.mother + " - "+ @sheep.mother_background, size: 9, :align => :center, :valign => :center
          transparent(0.8) { stroke_bounds }
      end
      bounding_box([433, 673], :width => 80, :height => 30) do
          text @sheep.father, size: 9, :align => :center, :valign => :center
          transparent(0.8) { stroke_bounds }
      end
      bounding_box([300, 635], :width => 58, :height => 25) do
          text @sheep.father, size: 7, :align => :center, :valign => :center
          transparent(0.8) { stroke_bounds }
      end
      bounding_box([360, 635], :width => 58, :height => 25) do
          text @sheep.mother + " - "+ @sheep.mother_background, size: 7, :align => :center, :valign => :center
          transparent(0.8) { stroke_bounds }
      end
      bounding_box([420, 635], :width => 58, :height => 25) do
          text @sheep.father, size: 7, :align => :center, :valign => :center
          transparent(0.8) { stroke_bounds }
      end
      bounding_box([480, 635], :width => 58, :height => 25) do
          text @sheep.father, size: 7, :align => :center, :valign => :center
          transparent(0.8) { stroke_bounds }
      end
  end
 
  
  def content
    y_position = cursor - 50
    birth(y_position)
    tree
    vacinations(y_position)
    terapies(cursor-30)
    purchase(cursor-30)
    lambings(cursor-30)
    selling(cursor-30)
 
  end
 
  def table_content(some_table)
    table some_table do
      row(0).font_style = :bold
      self.cell_style =  {:size => 9}
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.column_widths = [60, 130, 50]
    end

  end
  def lambings_rows
    data = [['Datum', 'jaganjci', 'komada']]
    @sheep.lambing_activities.map do |l|
     data+= [[l.activity.show_date, @sheep.lambs_list_from_lambing(l.activity_id), @sheep.lamb_number_from_lambing(l.activity_id)]]
    end
    return data  
  end
  def vacinations_rows
    data = [['Datum', 'razlog', 'sredstvo']] 
      @sheep.self_vacinations.map do |vac|
     data+= [[vac.id, vac.reason, vac.vaccin_name]]
    end
      return data
  end
  def terapies_rows
    data = [['Datum', 'razlog', 'sredstvo']] 
      @sheep.terapies.map do |vac|
     data+= [[vac.id, vac.reason, vac.vaccin_name]]
    end
      return data
  end
  
  def footer
      bounding_box([400, 15], :width => 200) do
          text "farma ovaca Tadici - " + Time.now.strftime("%d/%m/%Y %H:%M") + " - " , size: 6
      end
  end
  
  
end