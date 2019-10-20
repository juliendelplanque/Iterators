Extension { #name : #PiecesCutWhereIterator }

{ #category : #'*Iterators-Documentation' }
PiecesCutWhereIterator class >> example [
	<exampleWithExpectedResult: '#(#(1 2) #(3 1 6 1 2) #(3 4))'>
	| iterator |
	iterator := #(1 2 3 1 6 1 2 3 4) iterator.
	(iterator
		outputTo: [ :a :b | a = 2 and: [ b = 3 ] ] piecesCutWhereIt) "Cut the sequence of incoming objects if a 2 is followed by a 3."
		outputTo: Array
]
