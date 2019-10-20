Extension { #name : #UntilIterator }

{ #category : #'*Iterators-Documentation' }
UntilIterator class >> example [
	<exampleWithExpectedResult: '#(1 3)'>
	| iterator |
	iterator := #(1 3 2) iterator.
	(iterator
		outputTo: [ :x | x even ] untilIt) "Returns incoming objects while no even integer is encountered"
		outputTo: Array
]
