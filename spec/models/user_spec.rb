require "spec_helper"

describe User do
  describe "#password_required?" do

    context "new user" do
      let(:user) { build(:user) }

      it "requires password" do
        expect(user.password_required?).to eq true
      end
    end

    context "stored user without password" do
      let(:user) { create(:user, encrypted_password: "") }

      it "doesn't require password" do
        expect(user.password_required?).to eq false
      end
    end

    context "stored user with password" do
      let(:user) { create(:user, encrypted_password: "123") }

      it "requires password" do
        expect(user.password_required?).to eq true
      end
    end
  end
end
