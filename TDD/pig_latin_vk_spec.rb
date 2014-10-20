require 'rspec'
require_relative 'spec_helper'

VOWELS = %w[a e i o u]
PIG_SUFFIX = 'ay'

def translate(arg)
  raise if arg.empty?
  arg.split(/\s+/).map {|w| translate_word(w)}.join(' ')
end

def translate_word(arg)
  if VOWELS.include?(arg[0].downcase)
    arg + PIG_SUFFIX
  else
    arg.match /(qu|[^aeiou]+)(.*)/i
    $2 + $1 + PIG_SUFFIX
  end
end

describe 'PigLatinTranslator' do

  it 'translates single consonant start' do
    expect(translate("happy")).to eq 'appyhay'
    expect(translate('sad')).to eq 'adsay'
    expect(translate('yay')).to eq 'ayyay'
    expect(translate('qat')).to eq 'atqay'

  end

  it 'translates double consonant start' do
    expect(translate('track')).to eq 'acktray'
  end

  it 'translates vowel start' do
    expect(translate('asshat')).to eq 'asshatay'
  end

  it 'translates double vowel start' do
    expect(translate('air')).to eq 'airay'

  end

  it 'translates only vowels' do
    expect(translate('aaiieee')).to eq 'aaiieeeay'
  end

  it 'translates only consonants' do
    expect(translate('xzpdq')).to eq 'xzpdqay'
  end

  it 'is case-insensitive' do
    expect(translate('There')).to eq 'ereThay'
    expect(translate('Asshat')).to eq 'Asshatay'
  end

  it 'handles qu correctly' do
    expect(translate('quick')).to eq 'ickquay'
    expect(translate('Quick')).to eq 'ickQuay'
    expect(translate('racquet')).to eq 'acquetray'
  end

  it 'translates multiple words' do
    expect(translate('pig   latin')).to eq 'igpay atinlay'
  end

  it 'handles invalid input' do
    expect {translate('')}.to raise_error
  end

end