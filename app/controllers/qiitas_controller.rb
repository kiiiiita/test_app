class QiitasController < ApplicationController
  include HttpRequest

  QIITA_URI = "https://qiita.com/api/v2/items?page=1&per_page=10&query=stocks%3A%3E10"

  def index
    set_uri
    get_contents
  end

  private

    def set_uri
      uri = QIITA_URI
      if params[:tag]
        uri += "+tag%3A#{params[:tag]}"
      end
      @uri = uri
    end
end
