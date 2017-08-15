class ReportPdf < Prawn::Document
  def initialize(avaluo)
      super()
      @avaluo = @avaluo
      first_page
      start_new_page
      second_page
    end

    def first_page
      header
      footer
    end

    def second_page
    end

    def header
      image "#{Rails.root}/app/assets/images/logo.png", width: 200, height: 62, :position => :left
    end

    def footer
      bounding_box([bounds.left, bounds.bottom + 50], :width => bounds.width, :height => 100) do
        image "#{Rails.root}/app/assets/images/footer.png", fit: [bounds.width, 100]
      end
    end
end
