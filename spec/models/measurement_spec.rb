require 'rails_helper'

RSpec.describe Measurement, type: :model do
  let(:sclass_user) { create(:sclass_user) }
  describe "sclassユーザーは" do
    context "自分の測定結果を" do
      example "取得できる" do
        blogs = Measurement.get_current
        expect(blogs.length).to eq 1
      end
      example "登録できる" do
        blogs = Measurement.get_current
        expect(blogs.length).to eq 0
      end
      example "編集できる" do
        blogs = Measurement.get_current
        expect(blogs.length).to eq 1
      end
      example "削除できる" do
        blogs = Measurementß.get_current
        expect(blogs.length).to eq 1
      end
    end
  end
end
