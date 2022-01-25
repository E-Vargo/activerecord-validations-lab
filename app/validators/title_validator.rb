class TitleValidator <  ActiveModel::Validator
    def validate(record)
        unless record.title.include?("Won't Believe") || record.title.include?("Secret") || record.title.include?("Top [number]") || record.title.include?("Guess")
            record.errors[:title] << "Not click-batey enough!!"
        end
    end
end