ActiveAdmin.register Article do
  form do |f|
    f.inputs 'Article Info' do
      f.input :title
      f.input :subtitle
    end
    f.inputs 'URL Options' do
      f.input :slug
    end unless f.object.new_record?
    f.inputs 'Body Content' do
      f.input :body, as: :wysihtml5, commands: :all, blocks: :all, height: :huge
      f.input :caption, label: 'Caption (optional to customize)'
    end
    f.buttons
  end
end
