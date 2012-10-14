class Admin::BusterController < Admin::ResourceController
  model_class CacheBuster

  def index
    if request.post?
      buster = CacheBuster.find_by_name( (params[:name] ? params[:name] : CacheBuster.master_buster) )
      if buster.bust_buster
        flash[:notice] = "Cache Buster Reset for #{params[:name]} - Succeeded!"
      else
        flash[:notice] = "Cache Buster Reset for #{params[:name]} - FAILED!"
      end
    end

    @busters = CacheBuster.all
  end

  def all
    begin
      CacheBuster.destroy_all
      flash[:notice] = "All Cache Busters have been reset!"
    rescue 
      flash[:notice] = "Something went wrong."
    end
      
    @busters = CacheBuster.all
    render :action => :index
  end
end
