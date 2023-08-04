ActiveAdmin.register Catalogue do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :price, :discription, :gst, :total, :category_id, :sub_category_id, pictures: []

  form do |f|

    f.inputs do
    f.input :name
    f.input :price
    f.input :discription
    f.input :gst
    f.input :total
    f.input :category
    f.input :sub_category
    f.input :pictures, as: :file, input_html: { multiple: true }
  end
    f.actions
  end
  show do |x|
     attributes_table do
       row :name
       row :price
       row :discription
       row :gst 
       row :total 
       row :category 
       row :sub_category 
        row :pictures do |p|
          if p.pictures.attached?
        p.pictures.each do |x|
          span do 
            image_tag x, width: 150, height: 100
        end
      end
    else 
      "No Picture Attached"
    end
  end
end
end
index do
      column :name
      column :price
      column :description
      column :gst
      column :total
      column :category 
      column :sub_category
      column :pictures do |m|
        m.pictures.each do |img|
          span do
            image_tag img, width: 150, height: 100
          end
        end
      end
      actions
 end

  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :price, :discription, :gst, :total, :category_id, :sub_category_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
