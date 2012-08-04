module Api
  class CiController < BaseController

    def show
      plugin = Sources.ci_plugin(params[:source])
      result = plugin.get(params.delete(:server_url), params.delete(:project), params)
      if result
        p result.to_json
        respond_with(result.to_json)
      else
        respond_with({ :message => "No Data available" }.to_json, 500)
      end
    end

  end
end