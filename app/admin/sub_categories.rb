ActiveAdmin.register SubCategory do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :image, category_ids: []

  form do |f|
    f.inputs do
    f.input :name
    f.input :categories
    f.input :image, as: :file
  end
    f.actions
  end

  show do
     attributes_table do
       row :name
    row :image do |x|
      if x.image.attached?
      image_tag x.image, height: 100, width: 150  rescue nil
      else
        "No Picture Attached"
    end
    end
    end
    end


    index do
      column :name
      column :categories
    column "image" do |x|
       if x.image.attached?
        image_tag x.image, height: 100, width: 150  rescue nil
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
