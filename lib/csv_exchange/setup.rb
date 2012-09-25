module CsvExchange
  class Setup
    def initialize(csv_setup)
      @csv_setup = csv_setup
      @csv_setup[:cells] = []
      @csv_setup[:children] = []
    end
    
    def attribute(name, title, opts={})
      @csv_setup[:cells] << {:name => name, :title => title, 
                             :type => :attribute, :opts => opts}
    end
    
    def association(name, title, opts={})
      raise "Association map required" unless opts[:map]
      @csv_setup[:cells] << {:name => name, :title => title, 
                             :type => :association, :opts => opts}
    end

    def field(name, title)
      @csv_setup[:cells] << {:name => name, :title => title, :type => :field}
    end

    def children(name)
      @csv_setup[:children] << name
    end
    
  end
end