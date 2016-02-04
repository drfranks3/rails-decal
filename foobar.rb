class Foobar
    def self.baz(a)
        a.map{ |x| x.to_i + 2 }.delete_if{ |x| x > 10 || x.odd? }.inject(0,:+)
    end
end
