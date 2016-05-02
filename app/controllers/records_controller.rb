class RecordsController < ApplicationController

  def index
    @records = Record.all
  end

  def create
    mechanize = Mechanize.new
    page = mechanize.get("#{url_params['title']}")
    @first_title = page.at('#productTitle').text.strip
    @record = Record.new url_params_final.update({"title"=> @first_title})
    if @record.save
      render json: @record
    else
      render json: @record.errors, status: :unprocessable_entit
    end
  end

  private

    def url_params
      params.require(:record).permit(:title)
    end

    def url_params_final
      params.require(:record).permit(:title)
    end

end
