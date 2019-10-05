# User documentation of Iterators
This page contains the user documentation of Iterators project.

- [Iterators](#iterators)
  * [Collections](#collections)
  * [Trees](#trees)
- [Shell DSL](#shell-dsl)
- [Iterator Decorators](#iterator-decorators)
  * [Do](#do)
  * [Collect](#collect)
  * [Select](#select)
  * [Reject](#reject)
  * [Inject into](#inject-into)
  * [Reduce](#reduce)
  * [Groups of](#groups-of)
  * [Flatten](#flatten)
  * [Limit](#limit)
  * [Skip](#skip)
  * [Window](#window)
- [Chaining Iterator Decorators](#chaining-iterator-decorators)
- [Discarding Output](#discarding-output)
- [Iterator Wrappers](#iterator-wrappers)

## Iterators
An iterator is an object that understand 3 messages:

- `#hasNext` - Returns `true` if the iterator has a next object to provide. Else it returns false.
- `#peek` - Returns the next object without actually doing the iteration. Raises an `IteratorIsAtEnd` error if no next object is available.
- `#next` - Returns the next object in the iteration. Raises an `IteratorIsAtEnd` error if no next object is available.

> When an iterator reaches the end of the object it iterates on, an `IteratorIsAtEnd` error is signalled.

Here is an example of Iterators API usage:

```Smalltalk
iterator := #(1 2 3) iterator.
iterator hasNext. "true"
iterator peek. "1"
iterator next. "1"
iterator next. "2"
iterator next. "3"
iterator hasNext. "false"
iterator next. "Raises IteratorIsAtEnd error"
```

Additionally, an iterator can retrieve all the objects it will iterate on via `#upToXXX` messages familly:

- `#upToEndInto:` - Fills the collection provided as argument with the objects to iterate on.

```Smalltalk
iterator := #(1 2 3) iterator.
set := Set new.
iterator upToEndInto: set.
set "a Set(1 2 3)"
```

- `#upTo:into:` - Fills the collection provided as second argument with the n (provided as first argument) next objects to iterate on.

```Smalltalk
iterator := #(1 2 3) iterator.
set := Set new.
iterator upTo: 2 into: set.
set "a Set(1 2)"
```

- `#upToEnd` - Creates an array and fill it with objects to iterate on.

```Smalltalk
iterator := #(1 2 3) iterator.
iterator upToEnd. "#(1 2 3)"
```

- `#upToEndAs:` - Instantiate the class provided as argument and fill it with the objects to iterate on.

```Smalltalk
iterator := #(1 2 3) iterator.
iterator upToEndAs: OrderedCollection. "an OrderedCollection(1 2 3)"
```

- `#upTo:as:` - Instantiate the class provided as argument and fill it with the n (provided as first argument) objects to iterate on.

```Smalltalk
iterator := #(1 2 3) iterator.
iterator upTo: 2 as: OrderedCollection. "an OrderedCollection(1 2)"
```

- `#upToEndDiscardingResult` - Iterate on the objects to iterate on and discard the result.


### Collections
Iterators project adds extension methods to Collection objects.
It is always possible to get an `#iterator` from any Collection Pharo provides.

```Smalltalk
set := Set withAll: #(1 2 3 3 2 1).
setIterator := set iterator. "The order in which objects will be provided is not defined."
```

The `#iterator` message does not return a "pure" iterator, it returns an iterator that understand Collection API.
This allows one to create methods returning iterator but, clients of these methods can use them as a collection.
To get a pure iterator, send `#basicIterator`.

Some collections implement multiple `#basicXXXIterator` and `#XXXIterator` message because one can iterate on them in multiple them.

```Smalltalk
dict := Dictionary new
	at: #foo put: 1;
	at: #bar put: 2;
	yourself.
keysIterator := dict keysIterator.
valuesIterator := dict valuesIterator.
associationsIterator := dict associationsIterator
```

### Trees
Iterators project provide iterators for trees.
In the following example, one iterator iterate on object and its subclasses breadth-first and the second does it depth-first.

```Smalltalk
breadthFirstClassesHierarchyIterator := BreadthFirstIterator root: Object childrenBlock: #subclasses.
depthFirstClassesHierarchyIterator := DepthFirstIterator root: Object childrenBlock: #subclasses.
```

It is possible to use such iterator on any tree induced by the references between objects in the system.
One simply need to specify the tree `root` and a `block` or symbol to access the children from any node of the tree.

```Smalltalk
BreadthFirstIterator root: root childrenBlock: block.
```

## Shell DSL
Iterators provides a DSL to deal with iterators combination.

It is inspired from shell’s streams manipulation syntax:

- The pipe `|` operator allows one to chain iterators
- The `>` operator allows one to create a new collection with data transformed through chained iterators
- The `>>` operator allows one to fill an existing collection with data transformed through chained iterators

## Iterator Decorators
It is possible to decorate it with an `IteratorDecorator` to apply transformations and/or process on incoming data.

### Do
```Smalltalk
iterator := #(1 2 3) iterator.
iterator
	| [ :object | object logCr ] doIt "Just print incoming objects in transcript."
	> Array "#(1 2 3)"
```

### Collect
```Smalltalk
iterator := #(1 2 3) iterator.
iterator
	| [ :x | x * 2 ] collectIt "Multiply incoming integers by 2."
	> Array "(2 4 6)"
```

### Select
```Smalltalk
iterator := #(1 2 3) iterator.
iterator
	| [ :x | x odd ] selectIt "Let only odd integers traverse the filter."
	> Array "#(1 3)"
```

### Reject
```Smalltalk
iterator := #(1 2 3) iterator.
iterator
	| [ :x | x odd ] rejectIt "Let only non-odd (even) integers traverse the filter."
	> Array "#(2)"
```

### Inject into
```Smalltalk
iterator := #(1 2 3) iterator.
iterator
	| (10 injectItInto: [ :sum :x | sum + x ]) "Aggregate by summing incoming integers with 10 as initial value for the sum."
	> Array "#(16)"
```

### Reduce
```Smalltalk
iterator := #(1 2 3) iterator.
iterator
	| [ :x :y | x * y ] reduceIt "Multiply incoming integers together."
	> Array "#(6)"
```

### Groups of
```Smalltalk
iterator := #(1 2 3) iterator.
iterator
	| 2 groupIt "Create as much groups of 2 items as possible."
	> Array "#((1 2) (3))"
```

### Flatten
```Smalltalk
iterator := #((1 2) (3)) iterator.
iterator
	| FlattenIterator "Flatten incoming collections."
	> Array "#(1 2 3)"
```

### Limit
```Smalltalk
iterator := #(1 2 3) iterator.
iterator
	| 2 limitIt "Limit number of objects incoming to 2."
	> Array "#(1 2)"
```

### Skip
```Smalltalk
iterator := #(1 2 3) iterator.
iterator
	| 2 skipIt "Skip the 2 first incoming objects."
	> Array "#(3)"
```

### Window
```Smalltalk
iterator := #(1 2 3) iterator.
iterator
	| 2 windowIt "Creates a window of size 2."
	> Array "#((1 2) (3))"
```

### Until
```Smalltalk
iterator := #(1 3 2) iterator.
iterator
	| [ :x | x even ] untilIt "Returns incoming objects while no even integer is encountered"
	> Array "#(1 3)"
```

### Pieces cut where
```Smalltalk
iterator := #(1 2 3 1 6 1 2 3 4) iterator.
iterator
	| [ :a :b | a = 2 and: [ b = 3 ] ] piecesCutWhereIt "Cut the sequence of incoming objects if a 2 is followed by a 3."
	> Array "#(#(1 2) #(3 1 6 1 2) #(3 4))"
```

## Chaining Iterator Decorators

```Smalltalk
iterator := #(1 2 3) iterator.
iterator
	| [ :x | x * 2 ] collectIt
	| [ :x :y | x + y ] reduceIt
	> Array "#(12)"
````

## Discarding Output
```Smalltalk
iterator := #(1 2 3) iterator.
iterator
	| [ :x | x * 2 ] collectIt
	| [ :object | object logCr ] doIt "Just print incoming objects in transcript."
	> NullAddableObject "Special object that ignore incoming objects."
```

## Iterator Wrappers
> TODO
