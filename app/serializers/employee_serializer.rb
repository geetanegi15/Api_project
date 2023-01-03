class EmployeeSerializer < ActiveModel::Serializer
  attributes :id , :name , :role, :email , :pin
end
