class Admin::BusterController < Admin::ResourceController
  model_class CacheBuster

  def index
    if request.post?
      if CacheBuster.bust_buster
        flash[:notice] = "Cache Buster Reset - Succeeded!"
      else
        flash[:notice] = "Cache Buster Reset - FAILED!"
      end
    end
  end
end

