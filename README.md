# Iterators
[![Build Status](https://travis-ci.org/juliendelplanque/Iterators.svg?branch=master)](https://travis-ci.org/juliendelplanque/Iterators)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Pharo version](https://img.shields.io/badge/Pharo-6.1-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-7.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-8.0-%23aac9ff.svg)](https://pharo.org/download)

Implements Iterators for Pharo's Collections.

## Install
```Smalltalk
Metacello new
	baseline: 'Iterators';
	repository: 'github://juliendelplanque/Iterators/src';
	load
```


## Documentation

### Iterators

#### Collections
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

```Smalltalk
iterator := #(1 2 3) iterator.
iterator upToEnd. "#(1 2 3)"
```

```Smalltalk
iterator := #(1 2 3) iterator.
iterator upToEndAs: OrderedCollection. "an OrderedCollection(1 2 3)"
```

```Smalltalk
iterator := #(1 2 3) iterator.
set := Set new.
iterator upToEndInto: set.
set "a Set(1 2 3)"
```

```Smalltalk
set := Set withAll: #(1 2 3 3 2 1).
setIterator := set iterator. "The order in which objects will be provided is not defined."
```

```Smalltalk
dict := Dictionary new
	at: #foo put: 1;
	at: #bar put: 2;
	yourself.
keysIterator := dict keysIterator.
valuesIterator := dict valuesIterator.
associationsIterator := dict associationsIterator
```

#### Iterator With Collection API

#### Trees

```Smalltalk
breadthFirstClassesHierarchyIterator := BreadthFirstIterator root: Object childrenBlock: #subclasses.
depthFirstClassesHierarchyIterator := DepthFirstIterator root: Object childrenBlock: #subclasses.
```

### Iterators DSL
Iterators provides a DSL to deal with iterators combination.

It is inspired from shell’s streams manipulation syntax:

- The pipe `|` operator allows one to chain iterators
- The `>` operator allows one to create a new collection with data transformed through chained iterators
- The `>>` operator allows one to fill an existing collection with data transformed through chained iterators

### Iterator Decorators
It is possible to decorate it with an `IteratorDecorator` to apply transformations and/or process on incoming data.

#### Do
```Smalltalk
iterator := #(1 2 3) iterator.
iterator
	| [ :object | object logCr ] doIt "Just print incoming objects in transcript."
	> Array "#(1 2 3)"
```

#### Collect
```Smalltalk
iterator := #(1 2 3) iterator.
iterator
	| [ :x | x * 2 ] collectIt "Multiply incoming integers by 2."
	> Array "(2 4 6)"
```

#### Select
```Smalltalk
iterator := #(1 2 3) iterator.
iterator
	| [ :x | x odd ] selectIt "Let only odd integers traverse the filter."
	> Array "#(1 3)"
```

#### Reject
```Smalltalk
iterator := #(1 2 3) iterator.
iterator
	| [ :x | x odd ] rejectIt "Let only non-odd (even) integers traverse the filter."
	> Array "#(2)"
```

#### Inject into
```Smalltalk
iterator := #(1 2 3) iterator.
iterator
	| (10 injectItInto: [ :sum :x | sum + x ]) "Aggregate by summing incoming integers with 10 as initial value for the sum."
	> Array "#(16)"
```

#### Reduce
```Smalltalk
iterator := #(1 2 3) iterator.
iterator
	| [ :x :y | x * y ] reduceIt "Multiply incoming integers together."
	> Array "#(6)"
```

#### Groups of
```Smalltalk
iterator := #(1 2 3) iterator.
iterator
	| 2 groupIt "Create as much groups of 2 items as possible."
	> Array "#((1 2) (3))"
```

### Chaining Iterator Decorators

```Smalltalk
iterator := #(1 2 3) iterator.
iterator
	| [ :x | x * 2 ] collectIt
	| [ :x :y | x + y ] reduceIt
	> Array "#(12)"
````

### Discarding Output
```Smalltalk
iterator := #(1 2 3) iterator.
iterator
	| [ :x | x * 2 ] collectIt
	| [ :object | object logCr ] doIt "Just print incoming objects in transcript."
	> NullAddableObject "Special object that ignore incoming objects."
````

### Iterator Wrappers
> TODO
