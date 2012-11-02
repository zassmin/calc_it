ActiveAdmin.register TransactionImport do
  #
  # Menu
  #
  menu :parent => 'Users'

  #
  # Filters
  #
  filter :user, :as => :select, :collection => User.all.collect { |user| [user.email, user.id] }

  #
  # Index page
  #
  actions :all, :except => [:new, :create, :edit, :update, :destroy, :show]
  index do
    column :id
    column 'User Id', :user_id
    column :user_id do |transasction_import|
      if !transasction_import.user.nil?
        link_to transasction_import.user.email, admin_user_path(transasction_import.user)
      else
        'No user assoicated with transaction.'
      end
    end
    column 'CSV File', :csv_file_name do |transasction_import|
      link_to 'View file', transasction_import.csv.url
    end

    default_actions
  end


end
