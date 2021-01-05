require 'bike'

describe Bike do
  it 'responds to #working' do
    expect(subject).to respond_to :working?
  end
  it 'responds to #report_broken' do
    bike = Bike.new
    
    expect(bike).to respond_to :report_broken
  end
  
  it {is_expected.to respond_to :broken?}

  it 'is broken when it is reported as broken' do
    bike = Bike.new
    bike.report_broken
    
    expect(bike).to be_broken
    expect(bike).not_to be_working
  end
end
