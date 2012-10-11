class Admin::BusterController < Admin::ResourceController
  model_class CacheBuster

  def index
    if request.post?
      name = ( params[:name] ? params[:name] : CacheBuster::MASTER_BUSTER )
      if CacheBuster.buster!(name).bust_buster
        flash[:notice] = "Cache Buster Reset for #{name} - Succeeded!"
      else
        flash[:notice] = "Cache Buster Reset for #{name}- FAILED!"
      end
    end
  end

  def all
    CacheBuster.destroy_all
    flash[:notice] = "All Cache Busters have been reset!"
    render :action => :index
  end
end

