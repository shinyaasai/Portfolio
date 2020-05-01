require 'rails_helper'

RSpec.describe Tag, type: :model do
  
  it "tagはnullを許容しないこと" do
    expect{ create(:tag, not_null_column: nil) }.to raise_error
  end
end
