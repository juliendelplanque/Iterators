Extension { #name : #SkipIterator }

{ #category : #'*Iterators-Documentation' }
SkipIterator class >> example [
	<exampleWithExpectedResult: '#(3)'>
	| iterator |
	iterator := #(1 2 3) iterator.
	(iterator
		outputTo: 2 skipIt) "Skip the 2 first incoming objects."
		outputTo: Array
]
