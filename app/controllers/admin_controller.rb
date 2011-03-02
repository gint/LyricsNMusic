class AdminController < ApplicationController
	def login
		@title = "Login"
	end

	def show
		if !session[:admin_id]
			redirect_to :action=> 'login'
		end
	end

	def authenticate
		#Admin.new(params[:userform]) will create a new object of Admin, retrieve values from the form and store it variable @admin.
		@admin = Admin.new(params[:loginform])
        #find records with username,password
		valid_admin = Admin.find(:first,:conditions => ["email = ? and password = ?",@admin.email, @admin.password])

        #if statement checks whether valid_admin exists or not
		if valid_admin
        #creates a session with username
			session[:admin_id]=valid_admin.email
        #redirects the user to our private page.
			redirect_to :controller => 'invites',:action => 'show'
		else
			flash[:notice] = "Invalid User/Password"
			redirect_to :action=> 'login'
		end
	end

  def logout
	  if session[:admin_id]
		  reset_session
		  redirect_to :action=> 'login'
	  end
  end

end
