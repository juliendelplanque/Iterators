Extension { #name : #FlattenIterator }

{ #category : #'*Iterators-Documentation' }
FlattenIterator class >> example [
	<exampleWithExpectedResult: '#(1 2 3)'>
	| iterator |
	iterator := #((1 2) (3)) iterator.
	(iterator
		outputTo: FlattenIterator) "Flatten incoming collections."
		outputTo: Array
]
