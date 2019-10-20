Extension { #name : #CollectIterator }

{ #category : #'*Iterators-Documentation' }
CollectIterator class >> example [
	<exampleWithExpectedResult: '#(2 4 6)'>
	| iterator |
	iterator := #(1 2 3) iterator.
	(iterator
		outputTo: [ :x | x * 2 ] collectIt) 	"Multiply incoming integers by 2."
		outputTo: Array	
]
