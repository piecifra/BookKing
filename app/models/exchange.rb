class Exchange < ApplicationRecord
  belongs_to :mittente, :class_name => 'User'
  belongs_to :destinatario, :class_name => 'User'
end

