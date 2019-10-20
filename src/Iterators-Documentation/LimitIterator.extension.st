Extension { #name : #LimitIterator }

{ #category : #'*Iterators-Documentation' }
LimitIterator class >> example [
	<exampleWithExpectedResult: '#(1 2)'>
	| iterator |
	iterator := #(1 2 3) iterator.
	(iterator
		outputTo: 2 limitIt) "Limit number of objects incoming to 2."
		outputTo: Array
]
