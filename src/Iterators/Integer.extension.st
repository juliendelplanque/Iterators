Extension { #name : #Integer }

{ #category : #'*Iterators' }
Integer >> groupIt [
	^ GroupsOfIterator new
		groupSize: self;
		yourself
]
