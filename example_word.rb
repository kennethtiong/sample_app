class Word < String
	def palindrome?
		self == self.reverse
	end
end

def string_shuffle(s)
	s.split('').shuffle.join
end

class String
   def shuffle
     self.split('').shuffle.join
   end
end

# Create three hashes called person1, person2, and person3, with first and last names
#  under the keys :first and :last. Then create a params hash so that params[:father]
#   is person1, params[:mother] is person2, and params[:child] is person3. Verify that
#   , for example, params[:father][:first] has the right value.


person1 = {first: "f1", last: "l1"}
person2 = {first: "f2", last: "l2"}
person3 = {first: "f3", last: "l3"}
params = {father:person1, mother:person2, child:person3}