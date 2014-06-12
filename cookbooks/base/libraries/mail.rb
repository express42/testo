require 'rubygems'

module Express42
  class MailHandler < Chef::Handler
    def initialize(from_address, to_address)
      @from_address = from_address
      @to_address   = to_address
    end

    def report
      require 'pony'
      # The Node is available as +node+
      subject = "Chef run failed on #{node.name}"
      # +run_status+ is a value object with all of the run status data
      message = "#{run_status.formatted_exception}\n"
      # Join the backtrace lines. Coerce to an array just in case.
      message << Array(backtrace).join("\n")

      Pony.mail(
        :to => @to_address,
        :from => @from_address,
        :subject => subject,
        :body => message)

    end
  end
end

