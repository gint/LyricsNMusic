class InvitesController < ApplicationController
  # GET /invites
  # GET /invites.xml
  def index
	@title = "Invitation";
    @invites = Invite.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @invites }
    end
  end

  # GET /invites/1
  # GET /invites/1.xml
  def show
   if !session[:admin_id]
	redirect_to :controller => 'admin', :action=> 'login'
 	
   else	
	@title = "View Invitation Emails"
    @invites = Invite.find_all_emails
    @total = Invite.get_total_emails

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @invite }
    end
   end
  end

  # GET /invites/new
  # GET /invites/new.xml
  def new
    @invite = Invite.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @invite }
    end
  end

  # GET /invites/1/edit
  def edit
    @invite = Invite.find(params[:id])
  end

  # POST /invites
  # POST /invites.xml
  def create
    @invite = Invite.new(params[:invite])

    respond_to do |format|
      if @invite.save
	    flash[:success] = 'THANKS FOR SIGNING UP!'
        format.html { render "index" }
        format.xml  { render :action => "index", :xml => @invite, :status => :created }
		@invite = Invite.new
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @invite.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /invites/1
  # PUT /invites/1.xml
  def update
    @invite = Invite.find(params[:id])

    respond_to do |format|
      if @invite.update_attributes(params[:invite])
        format.html { redirect_to(@invite, :notice => 'Invite was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @invite.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /invites/1
  # DELETE /invites/1.xml
  def destroy
    @invite = Invite.find(params[:id])
    @invite.destroy

    respond_to do |format|
      format.html { redirect_to(invites_url) }
      format.xml  { head :ok }
    end
  end
end
