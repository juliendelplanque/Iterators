Extension { #name : #SortIterator }

{ #category : #'*Iterators-Documentation' }
SortIterator class >> example [
	<exampleWithExpectedResult: '#(3 2 1)'>
	| iterator |
	iterator := #(1 2 3) iterator.
	(iterator
		outputTo: #yourself descending sortIt) "Or use two-arguments block to sort incoming objects from greater to smaller."
		outputTo: Array
]

{ #category : #'*Iterators-Documentation' }
SortIterator class >> example2 [
	<exampleWithExpectedResult: '#(3 2 1)'>
	| iterator |
	iterator := #(1 2 3) iterator.
	(iterator
		outputTo: [ :x :y | x >= y ] sortIt) "Or use two-arguments block to sort incoming objects from greater to smaller."
		outputTo: Array
]
