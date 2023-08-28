ActiveAdmin.register Appointment do
   menu priority: 7
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :select_date, :select_time, :user_id, :service_provider_id, :status, :catalogue_id
    form do |f|

    f.inputs do
    f.input :select_date, as: :string, :input_html => {:class => 'datepicker'}
    f.input :select_time
    f.input :status
    f.input :user_id, as: :select, collection: User.all.where(status: "Guest").collect { |user| [user.firstname, user.id] }
    f.input :service_provider_id, as: :select, collection: User.all.where(status: "Service_provider").collect { |user| [user.email, user.id] }
    f.input :catalogue
   
    f.actions
  end
end

show do |x|
     attributes_table do
       row :select_date
       row :select_time
       row :user_id
       row :status
       row :catalogue
       row :service_provider_id do |record|
         if record.service_provider_id
          service_provider = User.find(record.service_provider_id)
          service_provider.email
         else
        "N/A"
        end
      end
      end 
    end

    index do
      selectable_column  
      column :select_date
      column :select_time
      column "User email_id" do |order|
  order.user
end
     
      column "Appointment status" do |order|
  order.status
end
      
       column "catalogue services" do |order|
  order.catalogue
end
      column :service_provider_id do |record|
         if record.service_provider_id
          service_provider = User.find(record.service_provider_id)
          service_provider.email
         else
        "N/A"
        end
      end
      
      actions
 end
     
   
  #
  # or
  #
  # permit_params do
  #   permitted = [:select_date, :select_time, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
