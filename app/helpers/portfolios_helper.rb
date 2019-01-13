module PortfoliosHelper
  def image_generator(height:, width:)
    "https://placehold.it/#{height}x#{width}"
  end

  def portfolio_img img, type
    if img.model.thumb_image? || img.model.main_image?
      img.url
    elsif type == 'thumb'
      image_generator(height: '350', width: '250').to_s
    else
      image_generator(height: '600', width: '400').to_s
    end
  end
end

