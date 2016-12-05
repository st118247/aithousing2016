class HousingDetail < ApplicationRecord
  mount_uploaders :housingcategorypics, HousingcategorypicUploader
end
