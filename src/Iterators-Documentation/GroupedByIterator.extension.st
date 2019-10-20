Extension { #name : #GroupedByIterator }

{ #category : #'*Iterators-Documentation' }
GroupedByIterator class >> example [
	<exampleWithExpectedResult: '{true->#(1 3). false->#(2)}'>
	| iterator |
	iterator := #(1 2 3) iterator.
	(iterator
		outputTo: #odd groupedByIt) "Groups the integer into 2 groups: true if the number is odd, false if it is even."
		outputTo: Array
]
