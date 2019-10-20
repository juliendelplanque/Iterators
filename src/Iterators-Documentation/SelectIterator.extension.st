Extension { #name : #SelectIterator }

{ #category : #'*Iterators-Documentation' }
SelectIterator class >> example [
	<exampleWithExpectedResult: '#(1 3)'>
	| iterator |
	iterator := #(1 2 3) iterator.
	(iterator
		outputTo: [ :x | x odd ] selectIt) "Let only odd integers traverse the filter."
		outputTo: Array
]

{ #category : #'*Iterators-Documentation' }
SelectIterator class >> exampleReject [
	<exampleWithExpectedResult: '#(1 3)'>
	| iterator |
	iterator := #(1 2 3) iterator.
	(iterator
		outputTo: [ :x | x odd ] rejectIt) "Let only non-odd (even) integers traverse the filter."
		outputTo: Array "#(2)"
]
