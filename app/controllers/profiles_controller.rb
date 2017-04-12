class ProfilesController < ApplicationController
  def new
      # form where a user can fill in their own profile
      @user = User.find( params[:user_id] )
      @profile = @user.build_profile 
  end
  
  def create 
    @user = user.find ( params[:user_id] )
    @profile = @user.build_profile(profile_params)
    if @profile.save
      flash[:success] = "Profile Created"
      redirect_to user_path( params[:user_id] )
    else 
      render action: :new 
    end  
  end
  
  private
    def profile_params 
      params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :email_address, :description)
    end
end