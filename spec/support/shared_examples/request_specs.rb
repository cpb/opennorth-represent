shared_examples_for type: :request do |context|
  let(:request_name) { context.metadata[:example_group][:description_args].last.sub('#','').to_sym }
  let(:service) { described_class.new(service_options) }

  def described_request(*args)
    service.send(request_name,*args)
  end
end
