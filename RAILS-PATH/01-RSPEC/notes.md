## Notes

1. use `describe` to group together examples/tests(e.g. executing tests on a series of methods), while `context` to setup/create a context that your testing with a series of examples(e.g. executing a series of tests on a particular method).

2. expect syntax - your passing an argument to `to` and `not_to`

```ruby
  expect(  ).to(  )
  expect(  ).not_to(  )
```

3. rspec options
    --format documentation(-f d) - show test descriptions
    --format progress(-f p) - show test progress as dots, no descriptions
    --profile/--no-profile(-p) - display a report displaying length of time tests took, displaying top 10 slowest tests
    --color/--no-color(-c) - display color/or not
    --order random - run tests in a random order
    --fail-fast/--no-fail-fast - stops at the first failure
    :[line_number] - run the test at the specified line number

4. Skipping tests/blocks of tests - place `x` in front of `it`, `describe` and `context`, e.g. `xit`, `xdescribe`, `xcontext`

```ruby
  it "some text to describe what is being tested and the expected outcome" do
    skip
  end

  it "some text to describe what is being tested and the expected outcome" do
    skip("provide a description as to why the test was skipped")
  end
```


5. Pending examples - omit the block or use the `pending` keyword in the block

  note: tests marked with the `pending` keyword are still executed. RSpec expects them to fail, that's why you marked them pending otherwise you would have used skip, and fails passing tests. Failing tests still fail, but aren't displayed in red.

```ruby
  it "some text to describe what is being tested and the expected outcome"

  it "some text to describe what is being tested and the expected outcome" do
    pending
  end

  it "some text to describe what is being tested and the expected outcome" do
    pending("provide a description as to why the test was skipped")
  end
```

6. Using matchers - general syntax

```ruby
  expect(actual).to match(expected)
```
  - match can be `eq`, `be_a`, `be_an_instance_of`, etc
  - matchers are used as arguments to #to()/not_to()
  - there are equivalence, truthiness, numeric-comparison, collection and observation matchers.


7. testing equivalence in ruby & RSpec

```ruby
  x = 1

  x == 1 # => true
  x == 1.0 # => true
  x == '1' # => false

  x.eql?(1) # => true
  x.eql?(1.0) # => false
  x.eql?('1') # => false

  y = 'Hello world'

  y == 'Hello world' # => true
  y.eql?('Hello world') # => true
  y.equal?('Hello world') # => false (object identity)


  expect(y).to eq('Hello world') #=> y == 'Hello world' -> true
  expect(y).to eql('Hello world') #=> y.eql?('Hello world') -> true
  expect(y).to equal('Hello world') #=> y.equal?('Hello world') -> false
  expect(y).to be('Hello world') #=> y.equal?('Hello world') ->false


```
  `be` is an alias of `equal`
