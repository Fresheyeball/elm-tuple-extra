# Tuple Extra

Additional helpers for working with tuples.

For example:

```elm
foo (x, y) = (x, y) -> (baz x, y)
```

becomes

```elm
foo = mapSnd baz
```
