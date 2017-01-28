class Person
  #constructor
  def initialize(name)
    #Redefinicion  del metodo new para enviar nil
    #En caso de que el nombre este vacio
    end
    def self.new(name)
      return nil if name.empty?
      super
    end
  end
