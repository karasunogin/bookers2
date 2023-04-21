class ApplicationController < ActionController::Base
before_action :authenticate_user!, except: [:top]
before_action :configure_permitted_parameters, if: :devise_controller?

def after_sign_in_path_for(resource)
  users_path
    if article.save
      redirect_to root_path, notice: "successfully"
    else
      flash[:alert] = "error"
      render :sign_in
    end
end

def after_sign_out_path_for(resouce)
  root_path
    if article.save
      redirect_to root_path, notice: "successfully"
    else
      flash[:alert] = "error"
      render :sign_out
    end
end

add_flash_types :sign_up, :sign_in, :sign_out, :user, :new, :update

protected

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
end

end
