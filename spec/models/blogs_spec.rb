require 'rails_helper'

RSpec.describe Blog, type: :model do
  let(:sclass_user) { create(:sclass_user) }
  describe "sclassユーザーは" do
    context "自分のブログを" do
      example "取得できる" do
        sclass_user
        blogs = Blog.get_current
        expect(blogs.length).to eq 1
      end
    end
    context "他人のブログを" do
      example "取得できない" do
        blogs = Blog.get_current
        expect(blogs.length).to eq 0
      end
    end
  end
end
