## ➰ Proc Currying and Composition

Use currying to partially apply arguments to Procs and compose complex pipelines. Composition chains multiple transformations into a single callable, leveraging block-to-proc conversions and `Proc#curry`.

```ruby
multiply = ->(x, y) { x * y }.curry
add      = ->(x, y) { x + y }.curry

double   = multiply.call(2)
increment = add.call(1)

# Compose: double then increment
pipeline = ->(v) { increment.call(double.call(v)) }

p pipeline.call(5) #=> 11
```