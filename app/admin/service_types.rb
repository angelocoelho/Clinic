# frozen_string_literal: true

ActiveAdmin.register ServiceType do
  permit_params :name, :duration_minutes, :price_cents, :specialty_id

  includes :specialty

  filter :name
  filter :specialty
  filter :duration_minutes
  filter :price_cents

  index do
    selectable_column
    id_column
    column :name
    column(:specialty)
    column(:duration_minutes) { |service_type| "#{service_type.duration_minutes} min" }
    column(:price) { |service_type| number_to_currency(service_type.price_cents.to_i / 100.0) }
    column :created_at
    actions
  end

  form do |f|
    f.inputs 'Tipo de Atendimento' do
      f.input :name
      f.input :specialty
      f.input :duration_minutes, hint: 'Em minutos (ex.: 50)'
      f.input :price_cents, hint: 'Em centavos (ex.: 15000 = R$150,00)'
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :specialty
      row(:duration_minutes) { |service_type| "#{service_type.duration_minutes} min" }
      row(:price) { |service_type| number_to_currency(service_type.price_cents.to_i / 100.0) }
      row :created_at
      row :updated_at
    end
  end
end
