# frozen_string_literal: true

ActiveAdmin.register Specialty do
  permit_params :name

  filter :name

  index do
    selectable_column
    id_column
    column :name
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end
end
