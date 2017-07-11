class Admin
  class AnalyticsController < ApplicationController
    include LoadAnalytic
    before_action :load_support
    def index
    end
  end
end
