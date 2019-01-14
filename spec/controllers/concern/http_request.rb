require 'rails_helper'
include HttpRequest
RSpec.describe HttpRequest, type: :concern do

  describe "get_content" do
    it "Qiitaの記事を取得すること" do
      @uri = "https://qiita.com/api/v2/items?page=1&per_page=10&query=stocks%3A%3E10"
      get_contents
      expect(@contents.present?).to be_truthy
    end

    it "errorになること" do
      @uri = ""
      get_contents
      expect(@errors.present?).to be_truthy
    end
  end
end
