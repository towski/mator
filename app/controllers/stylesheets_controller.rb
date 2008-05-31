class StylesheetsController < ApplicationController
  layout nil
  def application
    p params[:format]
    respond_to do |format|
      format.css { render :css => "application" , :content_type => "text/css" }
    end
  end
end