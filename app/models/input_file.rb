class InputFile < ActiveRecord::Base
  mount_uploader :inputfile, InputfileUploader
end
