ActiveAdmin.register Post do
  permit_params :title, :body, :image
# setting up the form for the posts
  show do |t|
    attributes_table do
      row :title
      row :body
      row :image do
        post.image? ? image_tag(post.image.url, height: '100') : content_tag(:span, "No photo yet")
      end
    end
  end
# also ensuring images upload link is showing
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs do
      f.input :title
      f.input :body
      f.input :image, hint: f.post.image? ? image_tag(post.image.url, height: '100'): content_tag(:span, "Upload JPG/PNG/GIF image")
  end
  f.actions
end
end
