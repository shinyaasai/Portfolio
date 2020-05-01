require 'rails_helper'

RSpec.describe "ApplicationHelper", type: :helper do
  include ApplicationHelper
  let(:record) { create(:record) }

  describe "full_titleヘルパー" do
    context "page_titleが空の場合" do
      it "base_titleを返すこと" do
        expect(full_title('')).to eq "SleepApp"
      end
    end

    context "空ではない場合" do
      it "page_titleを返すこと" do
        expect(full_title('睡眠記録')).to eq "睡眠記録-SleepApp"
      end
    end
  end
end
