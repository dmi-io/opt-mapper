class InputFilesController < ApplicationController
  
  def new
    @input_file = InputFile.new
  end
  
  def create
    input_filehandle = params[:input_file][:inputfile]
    if input_filehandle.nil?
      @errors = ["No input file"]
      @input_file = InputFile.new
      render new_input_file_path and return
    end
    input_file = input_filehandle.read
    @input_data = parse_input_file(input_file)
    
    out_data_reg = convert_input_data_reg(@input_data)
    #out_data_dss = convert_input_data_dss(input_data)
    
    out_data_csv = conv_to_csv(out_data_reg)
    
    send_data out_data_csv, filename: "citco-outputfile_" + DateTime.current.strftime("%Y%m%d-%H%M%S") + ".csv"
    
    #redirect_to send_output_files_path 
  end
  
private
  
  def parse_input_file(inp_file)
    row_number = 1
    inp_data = []
    CSV.parse(inp_file) do |row|
      if row_number == 1
        inp_data[0] = row
      else
        inp_data[row_number-1] = {} unless inp_data[row_number-1].present?
        inp_data[0].each_with_index do |col_name, idx|
          if ColumnMapping.where(col_title: col_name, col_type: ColumnMapping.col_types[:input]).present?
            inp_data[row_number-1][col_name] = row[idx]
          end
        end
      end
      row_number += 1
    end
    return inp_data
  end
  
  def convert_input_data_reg(input_data)
    # Take the fully-formed input data structure and convert it to a fully-formed output data structure
    out_data = []
    out_data[0] = []
    ColumnMapping.where(col_type: ColumnMapping.col_types[:out_reg]).order(:id).each do | col_map |
      out_data[0] << col_map.col_title
    end
    input_data.each_with_index do |inp_data_row, idx|
      if idx > 0
        out_data[idx] = []
        ColumnMapping.where(col_type: ColumnMapping.col_types[:out_reg]).order(:id).each do | col_map |
          if col_map.mapping_type == "direct"
            out_data[idx] << inp_data_row[col_map.col_title]
          elsif col_map.col_title == "Option RIC"
            #Note: Purposeful design decision not to use the ColumnMapping table to define the transformations, because
            #of the design complexity and therefore time to do so. Hard-coding for now -- it's a protoype!
            ric = ""
            ric = inp_data_row["OPT_UNDL_TICKER"][/\w+/] +
                    extract_formatted_date(input_data[idx]["OPT_EXPIRE_DT"], input_data[idx]["OPT_PUT_CALL"]) +
                    format_price(input_data[idx]["OPT_STRIKE_PX"]) + format_exch_code(input_data[idx]["EXCH_CODE"])
                    
            out_data[idx] << ric
            
          end
        end
      end
    end
    return out_data
  end
  
  def conv_to_csv(out_data, out_type = ColumnMapping.col_types[:out_reg])
    CSV.generate(headers: out_type == ColumnMapping.col_types[:out_reg]) do |csv|
      out_data.each do |row|
        csv << row
      end
    end
  end
  
  def extract_formatted_date(expire_date_input, opt_type)
    expire_date = Date.strptime(expire_date_input, "%m/%d/%Y")
    retstr = ""
    retstr = MonthCode.where(month_number: expire_date.month, put_or_call: opt_type).first.month_code.to_s
    retstr += expire_date.strftime("%-d")
    retstr += expire_date.strftime("%y")
    
    return retstr
  end
  
  def format_price(strike_price)
    if strike_price.to_i < 1000
      retstr = sprintf( "%05d", strike_price.to_i * 100 )
    else
      retstr = sprintf( "%05d", strike_price.to_i * 10 )
    end
    
    return retstr
  end
  
  def format_exch_code(exch_code)
    return (exch_code == "US" ? ".U" : "*")
  end  
  
end

