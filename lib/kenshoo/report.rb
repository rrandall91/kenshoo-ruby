module Kenshoo
  class Report
    include Connection
    extend Connection::ClassMethods

    attr_reader :id, :name, :template, :status, :last_run, :format, :owner, :profile

    def initialize(attributes)
      @id = attributes['reportId']
      @name = attributes['reportName']
      @template = attributes['template']
      @status = attributes['status']
      @last_run = attributes['lastRun']
      @format = attributes['format']
      @owner = attributes['owner']
      @profile = attributes['profile']
    end

    def self.all
      response = get(build_url({ resource: 'reports' }))
      response.map { |attributes| new attributes }
    end

    def self.find(id)
      response = get(build_url({ resource: 'reports', id: id }))
      Report.new response
    end

    def run(start_date, end_date)
      response = post(Report.build_url({ resource: 'reports', id: self.id, member: 'runs' }), { dateRange: { from: start_date, to: end_date } })
      Kenshoo::ConnectionError.raise_error(response.reason_phrase) unless response.status.to_s =~ /2\d\d/
      return response
    end
  end
end
