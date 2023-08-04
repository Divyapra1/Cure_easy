ActiveAdmin.register Category do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :name, :image

   form do |f|
    f.inputs do 
      f.input :name
      f.input :image, as: :file
   end
   f.actions
 end


  show do
     attributes_table do
       row :name
    row :image do |x|
      if x.image.attached?
      image_tag x.image, width: 150, height: 100 rescue  nil
      else
        "No Picture Attached"
    end
    end
    end
    end


    index do
      column :name
    column "image" do |x|
       if x.image.attached?
        image_tag x.image, width: 150, height: 100 rescue nil
      else 
        "No Picture Attached"
      end
    end
    actions
  end
   
  #
  # or
  #
  # permit_params do
  #   permitted = [:name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
