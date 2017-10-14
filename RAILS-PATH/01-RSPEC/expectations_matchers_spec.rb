describe 'Expectation Matchers' do

  describe 'equivalence matchers' do

    it 'will match loose equality with #eq' do
      # integer == float, but not integer eql?(float)
      a = "2 cats"
      b = "2 cats"
      expect(a).to eq(b)
      expect(a).to be == b      # synonym for #eq

      c = 17
      d = 17.0
      e = '17'
      expect(c).to eq(d)        # different types, but "close enough"
      expect(c).not_to eq(e)
    end

    it 'will match value equality with #eql' do
      # strict equality, equivalent to === in js
      a = "2 cats"
      b = "2 cats"
      expect(a).to eql(b)       # just a little stricter

      c = 17
      d = 17.0
      expect(c).not_to eql(d)   # not the same, close doesn't count
    end

    it 'will match identity equality with #equal' do
      a = "2 cats"
      b = "2 cats"
      expect(a).to eq(b) #=> true
      expect(a).to eql(b) #=> true
      expect(a).not_to equal(b) # same value, but different object, use a.object_id
      puts "a: #{a.object_id}, b: #{b.object_id}"
      c = b
      puts "b: #{b.object_id}, c: #{c.object_id}"
      expect(b).to equal(c)     # same object
      expect(b).to be(c)        # synonym for #equal
    end

  end



end
