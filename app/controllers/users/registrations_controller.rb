class Users::RegistrationsController < Devise::RegistrationsController
	
	def new
    super
  end

	def create
		super
	end

	def update
    super
  end

  protected
      def after_sign_up_path_for(resource)
        edit_user_path(current_user)
      end  
end