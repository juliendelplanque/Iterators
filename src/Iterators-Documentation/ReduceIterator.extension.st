Extension { #name : #ReduceIterator }

{ #category : #'*Iterators-Documentation' }
ReduceIterator class >> example [
	<exampleWithExpectedResult: '#(6)'>
	| iterator |
	iterator := #(1 2 3) iterator.
	(iterator
		outputTo: [ :x :y | x * y ] reduceIt) "Multiply incoming integers together."
		outputTo: Array
]
