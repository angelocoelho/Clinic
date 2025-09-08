# frozen_string_literal: true

ActiveAdmin.register Professional do
  permit_params :name, :registration_code, :email, :phone,
                :workday_start, :workday_end, specialty_ids: []

  includes :specialties

  filter :name
  filter :email
  filter :specialties

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :registration_code
    column :workday_start
    column :workday_end
    column('Specialties') { |professional| professional.specialties.map(&:name).join(', ') }
    actions
  end

  form do |f|
    f.inputs 'Dados' do
      f.input :name
      f.input :email
      f.input :registration_code
      f.input :phone
      f.input :workday_start
      f.input :workday_end
      f.input :specialties, as: :check_boxes
    end
    f.actions
  end
end
