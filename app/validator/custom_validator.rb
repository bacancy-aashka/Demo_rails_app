class CustomValidator < ActiveModel::Validator
    def validate(record)
        if record.year.present?
            if !record.website.present?
                record.errors.add(:website, "Website Name Needed..!!")
            end
            if !record.com_name.present?
                record.errors.add(:com_name, "Company Name Needed..!!")
            end
        end
    end
    
end