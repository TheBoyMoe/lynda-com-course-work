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


7. Testing equivalence in ruby & RSpec

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

8. Testing 'truthiness' - tells you if something is true or false
    - the presence of a value or object counts as being `truthy`
    - the evaluation of a condition, e.g. 5 > 3, can be true/false
    - the values true and false are true and false respectively
    - only nil or false count as `falsy`, although nil is not false

```ruby
  expect().to be(true)
  expect().not_to be(true)

  expect().to be(false)
  expect().to be(nil)

  expect().to be_truthy
  expect().to be_falsey
  expect().to be_nil

  expect(false).not_to be_nil
```

9. Numeric comparison

```ruby
  expect(100).to eq(100)
  expect(100).to be == 100

  expect(100).to be > 99
  expect(100).to be < 101
  expect(100).to be >= 100
  expect(100).to be <= 100

  expect(5).to be_between(3, 5).inclusive #=> include 3 and 5 in the range
  expect(5).not_to be_between(3, 5).exclusive #=> exclude 3 and 5

  expect(100).to be_within(5).of(105) #=> specify a delta of variation
  expect(1..10).to cover(3) #=> specify the number the range should cover
```

10. Collection matchers - used to match arrays, hashes or strings

11. Regular expression matcher - match a string using a regular expression, only works on strings

```ruby
  string = 'Hello world'
  expect(string).to match(/^H.+a$/)

  expect('123').to match(/\d{3}/) #=> match 3 digits
  expect(123).not_to match(/\d{3}/)
```

12. Object type matcher - check if an object is an instance of a class
      - instance - object type has to be the object's class, `@bob` has to be an instance of the Subscriber class
      - kind_of/be_a - the object, `@bob`, must be in the classes hierarchy, must be a subclass of customer, e.g. `Customer` is a superclass of `Subscriber`, or `Customer` is a module that has been mixed in.

```ruby
  expect(@bob).to be_an_instance_of(Subscriber) #=> check if the object is an instance of a class
  expect(@bob).to be_instance_of(Subscriber) #=> alias of above

  expect(@bob).to be_kind_of(Customer)
  expect(@bob).to be_a_kind_of(Customer)
  expect(@bob).to be_a(Customer)

  expect([1,2,3]).to be_an(Array)
  expect('hello world').to be_a(String)
```

13. Respond to matcher - check if an object responds to a certain method.

```ruby
  expect(@bob).to respond_to(:first_name)
```


14. Attribute matcher - check if an object has certain attributes

```ruby
  expect(@bob).to have_attributes(first_name:, last_name:)

  # check that the attributes and values match
  expect(@bob).to have_attributes(first_name: 'Bob', last_name: 'Smith')   
```


15. Satisfy matcher - takes a block (not an argument). The result should be true/false

```ruby
  expect(5).to satisfy {|v| v < 8 && v.even?}

  expect(@new_order).to satisfy do |order|
    order.placed? && order.email_sent?
  end
```
