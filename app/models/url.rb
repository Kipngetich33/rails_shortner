class Url < ApplicationRecord
    # include the common concerns in the model
    include Common
    # define relationship with statistics model
    has_many :statistics

    # class_methods do
    #     def public_count
    #         where(short: 'xyz1').count
    #     end
    # end
end
