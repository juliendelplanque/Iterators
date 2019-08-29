Extension { #name : #Integer }

{ #category : #'*Iterators' }
Integer >> groupIt [
	^ GroupsOfIterator new
		groupSize: self;
		yourself
]

{ #category : #'*Iterators' }
Integer >> limitIt [
	^ LimitIterator new
		limit: self;
		yourself
]

{ #category : #'*Iterators' }
Integer >> skipIt [
	^ SkipIterator new
		count: self;
		yourself
]
