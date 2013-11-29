ActiveAdmin.register Lecture do
  index do
    column :course
    column :classtime
    default_actions
  end

  filter :course

  form do |f|
    f.inputs "Admin Details" do
      f.input :course
      f.input :classtime
    end
    f.actions
  end
end


