require_relative "spec_helper"
require_relative "pig_latin"

describe "#translate" do
  include PigLatinTranslator

  it "should translate a simple word" do
    s = translate("nix")
    s.should == "ixnay"
  end

  it "should translate a word beginning with a vowel" do
    s = translate("apple")
    s.should == "appleay"
  end

  it "should translate a two consonant word: stupid" do
    s = translate("stupid")
    s.should == "upidstay"
  end

  it "should translate two words: eat pie" do
    s = translate("eat pie")
    s.should == "eatay iepay"
  end

  it "should translate multiple words: the quick brown fox" do
    s = translate("the quick brown fox")
    s.should == "ethay ickquay ownbray oxfay"
  end

  it "should not translate 'tu' as 'qu' " do
    s = translate("the quick turn")
    s.should == "ethay ickquay urntay"
  end

end
