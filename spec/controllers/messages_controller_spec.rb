require 'rails_helper'
describe MessagesController do
  let(:user) { create(:user) }
  let(:group) { create(:group) }
  let(:messages) { create_list(:message, 3, user: user, group: group) }


  describe "GET #index" do
    context "user_signed_in" do
      before do
        login_user user
        get :index, params: { group_id: group }
      end
      it "renders the :index template" do
        expect(response).to render_template :index
      end

      it "@assigns the requested group to @groups" do
        expect(assigns(:group)).to match group
      end

      it "assigns the requested blank_message to @message" do
        expect(assigns(:message)).to be_a_new(Message)
      end

      it "assigns the requested messages to @messages" do
        expect(assigns(:messages)).to match(messages)
      end
    end

    context "user_not_sgined_in" do
      before do
        get :index, params: { group_id: group }
      end
      it "redirect_to new_user_session" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end

  end

  describe "POST #create" do
    context "user_signed_in" do
      before do
        login_user user
      end

      it "message_save" do
        expect { post :create, params: { group_id: group, message: attributes_for(:message, user: user, group: group) }}.to change(Message, :count).by(1)
      end

      it "message_not_save" do
        expect { post :create, params: { group_id: group, message: attributes_for(:message, text: nil, image: nil, user: user, group: group) }}.not_to change(Message, :count).by(0)
      end
    end

    context "user_not_sgined_in" do
      it "redirect_to new_user_session" do
        post :create, params: { group_id: group, message: attributes_for(:message, user: user, group: group) }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
