# frozen_string_literal: true

ActiveAdmin.register Patient do
  permit_params :name, :email, :phone, :birthdate, :notes

  filter :name
  filter :email
  filter :birthdate

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :phone
    column :birthdate
    column :appointments_count
    column :created_at
    actions
  end

  form do |f|
    f.inputs 'Dados do Paciente' do
      f.input :name
      f.input :email
      f.input :phone
      f.input :birthdate, as: :datepicker
      f.input :notes
    end
    f.actions
  end
end
