Extension { #name : #Object }

{ #category : #'*Iterators' }
Object >> extractResultsForIterator: iterator upTo: size [
	"Hook called when the results of an iterator need to be extracted.
	 
	 Any class can extract results from an iterator without overriding this method
	 as long as it implements #add:.
	"
	| actualSize |
	actualSize := 0.
	[ iterator hasNext and: [ actualSize < size ] ]
		whileTrue: [ 
			self add: iterator next.
			actualSize := actualSize + 1 ].
	^ self
]

{ #category : #'*Iterators' }
Object class >> extractResultsForIterator: iterator upTo: size [
	^ iterator upTo: size into: self new
]
