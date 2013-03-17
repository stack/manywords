require_relative '../../test_helper'

module Manywords

  describe DictionaryNode do

    it "must be initially empty" do
      node = DictionaryNode.new
      node.count.must_equal 0
    end

    it "must add a word" do
      node = DictionaryNode.new

      node.add_word 'hello'
      node.count.must_equal 1

      node.add_word 'world'
      node.count.must_equal 2
    end

    it "must return maybe if empty" do
      node = DictionaryNode.new

      node.find_word('').must_equal :maybe
      node.find_word([]).must_equal :maybe
    end

    it "must verify a word is valid" do
      node = DictionaryNode.new
      node.add_word 'hello'

      node.find_word('hello').must_equal :yes
      node.find_word(%w{h e l l o}).must_equal :yes
    end

    it "must verify an invalid word is invalid" do
      node = DictionaryNode.new
      node.add_word 'hello'

      node.find_word('world').must_equal :no
      node.find_word(%w{w o r l d}).must_equal :no
    end

    it "must verify a series of letters could potentially be a word" do
      node = DictionaryNode.new
      node.add_word 'post'
      node.add_word 'postfix'

      node.find_word('p').must_equal :maybe
      node.find_word('po').must_equal :maybe
      node.find_word('pos').must_equal :maybe
      node.find_word('post').must_equal :yes
      node.find_word('postf').must_equal :maybe
      node.find_word('postfi').must_equal :maybe
      node.find_word('postfix').must_equal :yes

      node.find_word(%w{p}).must_equal :maybe
      node.find_word(%w{p o}).must_equal :maybe
      node.find_word(%w{p o s}).must_equal :maybe
      node.find_word(%w{p o s t}).must_equal :yes
      node.find_word(%w{p o s t f}).must_equal :maybe
      node.find_word(%w{p o s t f i}).must_equal :maybe
      node.find_word(%w{p o s t f i x}).must_equal :yes
    end

  end

end

