def refresh_quotations!
  [Currency, OpcvmFund].map do |model|
    query = (model == OpcvmFund) ? model.where(closed: false) : model
    query.all.reverse.map do |item|
      item.refresh_data
      item.refresh_quotation_history
    end
  end
  Matview::Base.refresh_all
end

begin
  load '~/.pryrc'
rescue LoadError
  puts 'Failed to load home pryrc'
end
