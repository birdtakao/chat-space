require 'rails_helper'

describe Message do
  describe '#create' do

    it "is valid with a text" do
      user = create(:user)
      group = create(:group)
      message = build(:message, image:nil)
      message.valid?
      expect(message).to be_valid
    end

    it "is valid with a image" do
      user = create(:user)
      group = create(:group)
      message = build(:message, text:nil)
      message.valid?
      expect(message).to be_valid
    end

    it "is valid with a text and a image" do
      user = create(:user)
      group = create(:group)
      message = build(:message)
      message.valid?
      expect(message).to be_valid
    end

    it "is invalid without a text and a image" do
      user = create(:user)
      group = create(:group)
      message = build(:message, text: nil, image: nil)
      message.valid?
      expect(message.errors[:text]).to include("を入力してください")
      expect(message.errors[:image]).to include("を入力してください")
    end

    it "is invalid without a group_id" do
      user = create(:user)
      group = create(:group)
      message = build(:message, group_id: nil)
      message.valid?
      expect(message.errors[:group]).to include("を入力してください")
    end

    it "is invalid without a user_id" do
      user = create(:user)
      group = create(:group)
      message = build(:message, user_id: nil)
      message.valid?
      expect(message.errors[:user]).to include("を入力してください")
    end

  end
end
