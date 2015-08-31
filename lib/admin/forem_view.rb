ActiveAdmin.register Forem::View do
  menu parent: 'Forem', label: 'Views'
  actions :index, :show, :destroy
end
