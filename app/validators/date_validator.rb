class DateValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
binding.pry
    date = date_before_type_cast
    return if date.blank?
    y = value[0, 4].to_i
    m = value[4, 2].to_i
    d = value[6, 2].to_i
    unless Date.valid_date?(y, m, d)
      record.errors[attribute] << (options[:message] || "is not a date")
    end
  end
end