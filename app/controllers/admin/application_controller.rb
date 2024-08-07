# All Administrate controllers inherit from this
# `Administrate::ApplicationController`, making it the ideal place to put
# authentication logic or other before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_admin

    def authenticate_admin
      if current_user.nil? # || !current_user.is_admin?
        redirect_to root_path, alert: 'غير مصرح لك بالدخول إالى هذه الصفحة .'
      end
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
    #
    def show_search_bar?
      true
    end

    # Return true if the current user can access the given
    # resource, false otherwise.
    def authorized_action?(resource, action)
      return true if current_user.is_admin?

      %w[Sale Product].include?(resource.model_name.name)
    end
  end
end
