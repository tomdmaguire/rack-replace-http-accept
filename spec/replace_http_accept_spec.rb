require 'spec_helper'

describe Rack::ReplaceHttpAccept do
  include Rack::Test::Methods
  
  def app
    @app
  end

  def app!(&block)
    @app = Rack::Builder.new do
      instance_eval(&block)
      run lambda { |env| [200, {}, []] }
    end.to_app
  end

  it 'should replace the http methods as given' do
    app! {use Rack::ReplaceHttpAccept, /application\/vnd\.mycompany\.myapp-v[0-9]+\+json/ => 'application/json', /application\/vnd\.mycompany\.myapp-v[0-9]+\+xml/  => 'application/xml'}
                                   
    get '/', {}, 'HTTP_ACCEPT' => 'application/vnd.mycompany.myapp-v1+json'
    last_response.should be_ok
    last_request.env['HTTP_ACCEPT'].should == 'application/json'

    get '/', {}, 'HTTP_ACCEPT' => 'application/vnd.mycompany.myapp-v1+xml'
    last_response.should be_ok
    last_request.env['HTTP_ACCEPT'].should == 'application/xml'
  end
end