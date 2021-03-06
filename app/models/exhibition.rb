class Exhibition
	include Elastictastic::Document

	field :title
	field :slug
	field :public, type: :boolean

	def self.find_by_term(q)
		begin
   pattern = /(\+|\-|\!|\(|\)|\{|\}|\[|\]|\^|\"|\~|\*|\?|\:|\\)/
   q = q.gsub(pattern){|match|"\\"  + match}
			exhibits = Exhibition.query(field: {title: "*#{q}*"}).query(field: {public: 1})
			exhibits.any?
			exhibits
		rescue
			nil
		end
	end
end