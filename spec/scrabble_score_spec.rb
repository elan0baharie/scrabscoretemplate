require('rspec')
require('scrabble_score')

describe("String#scrabble") do
  it("returns a scrabble score for a single letter") do
    expect(("a").scrabble()).to(eq(1))
  end
  it("returns a scrabble score for multiple letters") do
    expect("this".scrabble()).to(eq(7))
  end
end

describe("Fixnum#numbers_to_words") do
  it "returns single digit numbers" do
    expect(2.numbers_to_words()).to(eq("two"))
  end
  it "returns teens" do
    expect(12.numbers_to_words()).to(eq("twelve"))
  end
  it "returns double-digit numbers" do
    expect(32.numbers_to_words()).to(eq("thirty two"))
  end
  it "returns three-digit numbers with zeros" do
    expect(300.numbers_to_words()).to(eq("three hundred"))
  end
  it "returns three-digit numbers with teens" do
    expect(312.numbers_to_words()).to(eq("three hundred twelve"))
  end
  it "returns three-digit numbers with teens" do
    expect(345.numbers_to_words()).to(eq("three hundred forty five"))
  end
  it "returns long numbers" do
    expect(345020000435.numbers_to_words()).to(eq("three hundred forty five billion twenty million four hundred thrity five"))
  end
end


describe("String#words_to_numbers") do

end
