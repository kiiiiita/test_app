class Pdf::Invoice < Prawn::Document
  def initialize
    super()
    stroke_axis
  end
end
