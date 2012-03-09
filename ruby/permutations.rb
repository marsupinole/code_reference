def permute_array(a)
  1.upto(a.length - 1) do |i|
    j = rand(i + 1)
    a[i], a[j] = a[j], a[i]
  end
  a
end

mike = (1..5000).map{ permute_array("scott".split("")).join }.uniq.sort

class String
   def perm
       return [self] if self.length < 2
       ret = []
    
       0.upto(self.length - 1) do |n|
          #rest = self.split('')                
          rest = self.split(//u)            # for UTF-8 encoded strings
          picked = rest.delete_at(n)
          rest.join.perm.each { |x| ret << picked + x }
       end

       ret
   end
end

class Array
  def perm(n = size)
    if size < n or n < 0
    elsif n == 0
      yield([])
    else
      self[1..-1].perm(n - 1) do |x|
	(0...n).each do |i|
	  yield(x[0...i] + [first] + x[i..-1])
	end
      end
      self[1..-1].perm(n) do |x|
	yield(x)
      end
    end
  end
end

if $0 == __FILE__
  ["a", "b", "c", "d"].perm(3) do |x|  
    p x
  end
end