class buglistController < ApplicationController
  def index
    @buglist = Bug.all
    respond_to do |format|
      format.html
      format.json { render :json => @buglist }
    end
  end

  def create
    @bug = Bug.new(bug_params)
    respond_to do |format|
      format.json do 
        if @bug.save
          render :json => @bug
        else
          render :json => { :errors => @bug.errors.messages }, :status => 422
        end
      end
    end
  end

  def update
    @bug = Bug.find(params[:id])
    respond_to do |format|
      format.json do 
        if @bug.update(bug_params)
          render :json => @bug
        else
          render :json => { :errors => @bug.errors.messages }, :status => 422
        end
      end
    end
  end

  def destroy
    Bug.find(params[:id]).destroy
    respond_to do |format|
      format.json { render :json => {}, :status => :no_content }
    end
  end

  private

  def bug_params
    params.require(:bug).permit(:issue_type, :issue_date, :issue_name, :priority_level, :issue_desc, :issue_status)
  end
end
