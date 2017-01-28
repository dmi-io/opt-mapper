# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

########### MonthCode table ###########

MonthCode.delete_all

#January
MonthCode.create!(month_number: 1, put_or_call: "Call", month_code: "A")
MonthCode.create!(month_number: 1, put_or_call: "Put", month_code: "M")

#February
MonthCode.create!(month_number: 2, put_or_call: "Call", month_code: "B")
MonthCode.create!(month_number: 2, put_or_call: "Put", month_code: "N")

#March
MonthCode.create!(month_number: 3, put_or_call: "Call", month_code: "C")
MonthCode.create!(month_number: 3, put_or_call: "Put", month_code: "O")

#April
MonthCode.create!(month_number: 4, put_or_call: "Call", month_code: "D")
MonthCode.create!(month_number: 4, put_or_call: "Put", month_code: "P")

#May
MonthCode.create!(month_number: 5, put_or_call: "Call", month_code: "E")
MonthCode.create!(month_number: 5, put_or_call: "Put", month_code: "Q")

#June
MonthCode.create!(month_number: 6, put_or_call: "Call", month_code: "F")
MonthCode.create!(month_number: 6, put_or_call: "Put", month_code: "R")

#July
MonthCode.create!(month_number: 7, put_or_call: "Call", month_code: "G")
MonthCode.create!(month_number: 7, put_or_call: "Put", month_code: "S")

#August
MonthCode.create!(month_number: 8, put_or_call: "Call", month_code: "H")
MonthCode.create!(month_number: 8, put_or_call: "Put", month_code: "T")

#September
MonthCode.create!(month_number: 9, put_or_call: "Call", month_code: "I")
MonthCode.create!(month_number: 9, put_or_call: "Put", month_code: "U")

#October
MonthCode.create!(month_number: 10, put_or_call: "Call", month_code: "J")
MonthCode.create!(month_number: 10, put_or_call: "Put", month_code: "V")

#November
MonthCode.create!(month_number: 11, put_or_call: "Call", month_code: "K")
MonthCode.create!(month_number: 11, put_or_call: "Put", month_code: "W")

#December
MonthCode.create!(month_number: 12, put_or_call: "Call", month_code: "L")
MonthCode.create!(month_number: 12, put_or_call: "Put", month_code: "X")

########### ColumnMapping table ###########

ColumnMapping.delete_all

ColumnMapping.create!(col_title: "OPT_UNDL_TICKER", col_type: ColumnMapping.col_types[:input])
ColumnMapping.create!(col_title: "OPT_EXPIRE_DT", col_type: ColumnMapping.col_types[:input])
ColumnMapping.create!(col_title: "OPT_PUT_CALL", col_type: ColumnMapping.col_types[:input])
ColumnMapping.create!(col_title: "OPT_STRIKE_PX", col_type: ColumnMapping.col_types[:input])
ColumnMapping.create!(col_title: "EXCH_CODE", col_type: ColumnMapping.col_types[:input])

ColumnMapping.create!(col_title: "cadis_id", col_type: ColumnMapping.col_types[:input])
ColumnMapping.create!(col_title: "tid", col_type: ColumnMapping.col_types[:input])
ColumnMapping.create!(col_title: "id_bb_global", col_type: ColumnMapping.col_types[:input])
ColumnMapping.create!(col_title: "UNDERLYING_ID_BB_GLOBAL", col_type: ColumnMapping.col_types[:input])
ColumnMapping.create!(col_title: "SECURITY_DES", col_type: ColumnMapping.col_types[:input])


ColumnMapping.create!(col_title: "cadis_id", col_type: ColumnMapping.col_types[:out_reg], mapping_type: "direct")
ColumnMapping.create!(col_title: "tid", col_type: ColumnMapping.col_types[:out_reg], mapping_type: "direct")
ColumnMapping.create!(col_title: "id_bb_global", col_type: ColumnMapping.col_types[:out_reg], mapping_type: "direct")
ColumnMapping.create!(col_title: "UNDERLYING_ID_BB_GLOBAL", col_type: ColumnMapping.col_types[:out_reg], mapping_type: "direct")
ColumnMapping.create!(col_title: "SECURITY_DES", col_type: ColumnMapping.col_types[:out_reg], mapping_type: "direct")
ColumnMapping.create!(col_title: "Option RIC", col_type: ColumnMapping.col_types[:out_reg])





