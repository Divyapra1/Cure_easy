ActiveAdmin.register PrivacyPolicy do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :discription

  form do |f|

    f.inputs do
    f.input :discription
  end
    f.actions
  end

  show do
     attributes_table do
       row :name
    row :discription
    end
  end

    index do
      column :discription
      
    actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:discription]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
