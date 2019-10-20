Extension { #name : #WindowIterator }

{ #category : #'*Iterators-Documentation' }
WindowIterator class >> example [
	<exampleWithExpectedResult: '#((1 2) (3))'>
	| iterator |
	iterator := #(1 2 3) iterator.
	(iterator
		outputTo: 2 windowIt) "Creates a window of size 2."
		outputTo: Array
]
