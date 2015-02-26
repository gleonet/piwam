class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale, :authenticate_member

  def current_member
    @current_member ||= Member.find(session[:member_id]) if session[:member_id]
  end

  def current_ability
    @current_ability ||= Ability.new(current_member)
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to access_denied_url
  end

  private

    def set_locale
      I18n.locale = Setting.region.downcase || I18n.default_locale
    end

    def authenticate_member
      if current_member.nil?
        redirect_to Member.any? ? login_url : setup_url
      end
    end

end
