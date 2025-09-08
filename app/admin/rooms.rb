#frozen_string_literal: true

ActiveAdmin.register Room do
  permit_params :name, :location

  filter :name
  filter :location

  index do
    selectable_column
    id_column
    column :name
    column :location
    column :created_at
    actions
  end

  form do |f|
    f.inputs "Sala" do
      f.input :name
      f.input :location
    end
    f.actions
  end
end
