require_relative '../../test_helper'

module Manywords

  describe Walker do

    it "must walk a sequence in order" do
      data = []

      walker = Walker.new
      walker.walk "3210" do |word|
        data << word
      end

      data.count.must_equal 65

      data[0].must_equal  []
      data[1].must_equal  %w{ 0 }
      data[2].must_equal  %w{ 0 1 }
      data[3].must_equal  %w{ 0 1 2 }
      data[4].must_equal  %w{ 0 1 2 3 }
      data[5].must_equal  %w{ 0 1 3 }
      data[6].must_equal  %w{ 0 1 3 2 }
      data[7].must_equal  %w{ 0 2 }
      data[8].must_equal  %w{ 0 2 1 }
      data[9].must_equal  %w{ 0 2 1 3 }
      data[10].must_equal %w{ 0 2 3 }
      data[11].must_equal %w{ 0 2 3 1 }
      data[12].must_equal %w{ 0 3 }
      data[13].must_equal %w{ 0 3 1 }
      data[14].must_equal %w{ 0 3 1 2 }
      data[15].must_equal %w{ 0 3 2 }
      data[16].must_equal %w{ 0 3 2 1 }
      data[17].must_equal %w{ 1 }
      data[18].must_equal %w{ 1 0 }
      data[19].must_equal %w{ 1 0 2 }
      data[20].must_equal %w{ 1 0 2 3 }
      data[21].must_equal %w{ 1 0 3 }
      data[22].must_equal %w{ 1 0 3 2 }
      data[23].must_equal %w{ 1 2  }
      data[24].must_equal %w{ 1 2 0 }
      data[25].must_equal %w{ 1 2 0 3 }
      data[26].must_equal %w{ 1 2 3 }
      data[27].must_equal %w{ 1 2 3 0 }
      data[28].must_equal %w{ 1 3 }
      data[29].must_equal %w{ 1 3 0 }
      data[30].must_equal %w{ 1 3 0 2 }
      data[31].must_equal %w{ 1 3 2 }
      data[32].must_equal %w{ 1 3 2 0 }
      data[33].must_equal %w{ 2 }
      data[34].must_equal %w{ 2 0 }
      data[35].must_equal %w{ 2 0 1 }
      data[36].must_equal %w{ 2 0 1 3 }
      data[37].must_equal %w{ 2 0 3 }
      data[38].must_equal %w{ 2 0 3 1 }
      data[39].must_equal %w{ 2 1 }
      data[40].must_equal %w{ 2 1 0 }
      data[41].must_equal %w{ 2 1 0 3 }
      data[42].must_equal %w{ 2 1 3 }
      data[43].must_equal %w{ 2 1 3 0 }
      data[44].must_equal %w{ 2 3 }
      data[45].must_equal %w{ 2 3 0 }
      data[46].must_equal %w{ 2 3 0 1 }
      data[47].must_equal %w{ 2 3 1 }
      data[48].must_equal %w{ 2 3 1 0 }
      data[49].must_equal %w{ 3 }
      data[50].must_equal %w{ 3 0 }
      data[51].must_equal %w{ 3 0 1 }
      data[52].must_equal %w{ 3 0 1 2 }
      data[53].must_equal %w{ 3 0 2 }
      data[54].must_equal %w{ 3 0 2 1 }
      data[55].must_equal %w{ 3 1 }
      data[56].must_equal %w{ 3 1 0 }
      data[57].must_equal %w{ 3 1 0 2 }
      data[58].must_equal %w{ 3 1 2 }
      data[59].must_equal %w{ 3 1 2 0 }
      data[60].must_equal %w{ 3 2 }
      data[61].must_equal %w{ 3 2 0 }
      data[62].must_equal %w{ 3 2 0 1 }
      data[63].must_equal %w{ 3 2 1 }
      data[64].must_equal %w{ 3 2 1 0 }
    end

    it "must expand pluses to every letter" do
      data = []

      walker = Walker.new
      walker.walk "a+" do |word|
        data << word
      end

      # 26 * 2 for each letter of the +
      # 26 for each a combination
      # 1 single a, 1 blank
      data.count.must_equal 80

      data[0].must_equal []
      data[1].must_equal %w{ a }
      data[2].must_equal %w{ a a }
      data[3].must_equal %w{ b }
      data[4].must_equal %w{ b a }
      data[5].must_equal %w{ c }
      data[6].must_equal %w{ c a }
      data[7].must_equal %w{ d }
      data[8].must_equal %w{ d a }
      data[9].must_equal %w{ e }
      data[10].must_equal %w{ e a }
      data[11].must_equal %w{ f }
      data[12].must_equal %w{ f a }
      data[13].must_equal %w{ g }
      data[14].must_equal %w{ g a }
      data[15].must_equal %w{ h }
      data[16].must_equal %w{ h a }
      data[17].must_equal %w{ i }
      data[18].must_equal %w{ i a }
      data[19].must_equal %w{ j }
      data[20].must_equal %w{ j a }
      data[21].must_equal %w{ k }
      data[22].must_equal %w{ k a }
      data[23].must_equal %w{ l }
      data[24].must_equal %w{ l a }
      data[25].must_equal %w{ m }
      data[26].must_equal %w{ m a }
      data[27].must_equal %w{ n }
      data[28].must_equal %w{ n a }
      data[29].must_equal %w{ o }
      data[30].must_equal %w{ o a }
      data[31].must_equal %w{ p }
      data[32].must_equal %w{ p a }
      data[33].must_equal %w{ q }
      data[34].must_equal %w{ q a }
      data[35].must_equal %w{ r }
      data[36].must_equal %w{ r a }
      data[37].must_equal %w{ s }
      data[38].must_equal %w{ s a }
      data[39].must_equal %w{ t }
      data[40].must_equal %w{ t a }
      data[41].must_equal %w{ u }
      data[42].must_equal %w{ u a }
      data[43].must_equal %w{ v }
      data[44].must_equal %w{ v a }
      data[45].must_equal %w{ w }
      data[46].must_equal %w{ w a }
      data[47].must_equal %w{ x }
      data[48].must_equal %w{ x a }
      data[49].must_equal %w{ y }
      data[50].must_equal %w{ y a }
      data[51].must_equal %w{ z }
      data[52].must_equal %w{ z a }
      data[53].must_equal %w{ a }
      data[54].must_equal %w{ a a }
      data[55].must_equal %w{ a b }
      data[56].must_equal %w{ a c }
      data[57].must_equal %w{ a d }
      data[58].must_equal %w{ a e }
      data[59].must_equal %w{ a f }
      data[60].must_equal %w{ a g }
      data[61].must_equal %w{ a h }
      data[62].must_equal %w{ a i }
      data[63].must_equal %w{ a j }
      data[64].must_equal %w{ a k }
      data[65].must_equal %w{ a l }
      data[66].must_equal %w{ a m }
      data[67].must_equal %w{ a n }
      data[68].must_equal %w{ a o }
      data[69].must_equal %w{ a p }
      data[70].must_equal %w{ a q }
      data[71].must_equal %w{ a r }
      data[72].must_equal %w{ a s }
      data[73].must_equal %w{ a t }
      data[74].must_equal %w{ a u }
      data[75].must_equal %w{ a v }
      data[76].must_equal %w{ a w }
      data[77].must_equal %w{ a x }
      data[78].must_equal %w{ a y }
      data[79].must_equal %w{ a z }
    end

  end

end

