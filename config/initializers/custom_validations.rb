# Custom Validations
ActiveRecord::Base.class_eval do
  def self.validates_length_byte_of(*args)
    options = args.extract_options!
    fail 'maximumの指定が必要' if options[:maximum].blank?

    validates_each(*(args << options)) do |record, attribute, value|
      if value.present?
        # UTF8→SJIS変換
        sjis_value = value.encode(Encoding::SJIS, invalid: :replace, undef: :replace)
        record.errors.add(attribute, "は#{options[:maximum]}バイト以内で入力してください。") if sjis_value.bytesize > options[:maximum]
      end
    end
  end
end
