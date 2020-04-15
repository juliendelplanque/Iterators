Extension { #name : #SequenceableCollection }

{ #category : #'*Iterators' }
SequenceableCollection class >> extractResultsForIterator: iterator upTo: size [
	| actualSize expectedUpToEndSize |
	actualSize := 0.
	expectedUpToEndSize := size isInfinite
		ifTrue: [ iterator maximalUpToEndSize ]
		ifFalse: [ size ].
	^ self new: expectedUpToEndSize streamContents: [ :stream |
		[ iterator hasNext and: [ actualSize < size ] ]
			whileTrue: [ 
				stream nextPut: iterator next.
				actualSize := actualSize + 1 ] ]
]
