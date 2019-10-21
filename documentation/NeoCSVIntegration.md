# NeoCSV integration

Iterators project provides a layer to integrate with [NeoCSV](https://github.com/svenvc/NeoCSV) framework.

Let say the file `/tmp/example.csv` was created as follow:

```Smalltalk
FileLocator temp / 'example.csv' writeStreamDo: [ :writeStream |
	writeStream nextPutAll: 'a,b,c
d,e,f
g,h,i' ].
```

An iterator can be retrieved from a `NeoCSVReader` instance via `#iterator` (to get an iterator wrapped
by `IteratorWithCollectionAPI` decorator) or `#basicIterator` messages.

```Smalltalk
FileLocator temp / 'example.csv' readStreamDo: [ :readStream |
	(NeoCSVReader on: readStream) iterator
		| FlattenIterator
		| #first collectIt
		| #uppercase collectIt
		> String ] "'ABCDEFGHI'"
```
