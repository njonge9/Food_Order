module User::PasswordReset
  extend ActiveSupport::Concern

  included do
    has_secure_password :password_reset_token, validations: false
  end

  def reset_password
    update(
      password_reset_token: self.class.generate_unique_secure_token
    )
    app_sessions.destroy_all

    send_password_reset_email
  end

  private

  def send_password_reset_email
    UserMailer.with(user: self)
              .password_reset(CGI.escape(password_reset_id))
              .deliver_now
  end

  def password_reset_id
    message_verifier.generate({
      user_id: id,
      password_reset_token: password_reset_token
    }, purpose: :password_reset, expires_in: 2.hours)
  end
end
