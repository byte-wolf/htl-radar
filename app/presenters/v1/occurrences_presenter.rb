class V1::OccurrencesPresenter < V1::BasePresenter

  def initialize(occurrences)
    @occurrences = occurrences
  end

  def as_json(options={})
    # fill me in...
  end

  def to_xml(options={}, &block)
    xml = options[:builder] ||= Builder::XmlMarkup.new
    # fill me in...
  end
end
