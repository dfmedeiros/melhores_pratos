class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    auth = request.env["omniauth.auth"]
    account = SocialAccount.find_by(provider: auth['provider'], uid: auth['uid'])

    if account
      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect(:user, account.user)
    else
      user = User.find_or_initialize_by(email: auth['extra']['raw_info']['email'])
      user.apply_omniauth(auth)

      if user.save(:validate => false)
        flash[:notice] = "Account created and signed in successfully."
        sign_in_and_redirect(:user, user)
      else
        flash[:error] = "Error while creating a user account. Please try again."
        redirect_to root_url
      end
    end
  end
  alias_method :facebook, :all
end