
class UrlShortenerController < ApplicationController

    skip_before_action :verify_authenticity_token
    
    def shorten
        original_url = params[:original_url]
        short_url = Shortener::ShortenedUrl.generate(original_url)
        
        puts "Nueva URL: #{short_url.url}"
        render json: { original_url: original_url, short_url: short_url.url }
    end
end
