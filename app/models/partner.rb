class Partner < Content
  has_many :certificates, foreign_key: "partner_id"
end
