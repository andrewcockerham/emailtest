class MyDevise::RegistrationsController < Devise::RegistrationsController

	# customize devise 'create user' method
	def create
		super # this calls the default Devise::RegistrationsController#create
		if resource.save
			UserMailer.welcome_email(@user).deliver
		end
	end
end