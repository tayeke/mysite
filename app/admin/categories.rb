ActiveAdmin.register Category do
  form do |f|
    f.inputs 'Category Info' do
      f.input :name
      f.input :slug, label: 'URL Slug' unless f.object.new_record?
      f.input :icon, hint: (f.object.icon.blank?) ? '' : f.template.image_tag(f.object.icon)
    end
    f.buttons
  end
end
