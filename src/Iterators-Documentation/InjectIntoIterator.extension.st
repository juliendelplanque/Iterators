Extension { #name : #InjectIntoIterator }

{ #category : #'*Iterators-Documentation' }
InjectIntoIterator class >> example [
	<exampleWithExpectedResult: '#(16)'>
	| iterator |
	iterator := #(1 2 3) iterator.
	(iterator
		outputTo: (10 injectItInto: [ :sum :x | sum + x ])) "Aggregate by summing incoming integers with 10 as initial value for the sum."
		outputTo: Array
]
