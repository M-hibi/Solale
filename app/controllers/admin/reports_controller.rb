class Admin::ReportsController < ApplicationController
    def index
        @reports = Report.all
        @users = User.all
    end
end
