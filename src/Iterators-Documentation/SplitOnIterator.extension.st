Extension { #name : #SplitOnIterator }

{ #category : #'*Iterators-Documentation' }
SplitOnIterator class >> example [
	<exampleWithExpectedResult: '#((1) (3))'>
	| iterator |
	iterator := #(1 2 3) iterator.
	(iterator
		outputTo: 2 splitOnIt)
		outputTo: Array
]

{ #category : #'*Iterators-Documentation' }
SplitOnIterator class >> example2 [
	<exampleWithExpectedResult: '#((1) (3))'>
	| iterator |
	iterator := #(1 2 3) iterator.
	(iterator
		outputTo: [ :x | x = 2 ] splitOnIt)
		outputTo: Array
]
