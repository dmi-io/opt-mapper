class ColumnMapping < ActiveRecord::Base

  enum col_type: [:input, :out_reg, :out_dss]

end
