class DocumentController < ApplicationController
  def index
    respond_to do |format|
      format.pdf do
        test_pdf = Pdf::Invoice.new.render
        send_data test_pdf,
          filename:    'test.pdf',
          type:        'application/pdf',
          disposition: 'inline' # 画面に表示
      end
    end
  end
end
