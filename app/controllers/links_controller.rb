class LinksController < ApplicationController
	
 def create 
 shortener = Shortener.new(links_params[:original_url])
 @link = shortener.generate_short_link
 if @link.persisted?
    respond_to :js
    else
    render 'error.js.erb'
    end
 end



 def alllinks
 authorize! :manage, nil
 @links = Link.ordered
 end

 private

 def links_params
 params.require(:link).permit(:original_url)
 end
end