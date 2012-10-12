class Admin::BusterController < Admin::ResourceController
  model_class CacheBuster

  def index
    if request.post?
      buster = CacheBuster.find_by_name( (params[:name] ? params[:name] : CacheBuster::MASTER_BUSTER) )
      if buster.bust_buster
        flash[:notice] = "Cache Buster Reset for #{name} - Succeeded!"
      else
        flash[:notice] = "Cache Buster Reset for #{name} - FAILED!"
      end
    end
  end

  def all
    CacheBuster.destroy_all
    flash[:notice] = "All Cache Busters have been reset!"
    render :action => :index
  end
end

