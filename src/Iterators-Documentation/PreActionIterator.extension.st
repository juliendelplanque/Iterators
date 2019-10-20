Extension { #name : #PreActionIterator }

{ #category : #'*Iterators-Documentation' }
PreActionIterator class >> example [
	<exampleWithExpectedResult: '#(1 2 3)'>
	| iterator |
	iterator := #(1 2 3) iterator.
	(iterator
		outputTo: [ :object | object logCr ] doIt) "Just print incoming objects in transcript."
		outputTo: Array
]
