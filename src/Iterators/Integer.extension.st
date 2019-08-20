Extension { #name : #Integer }

{ #category : #'*Iterators' }
Integer >> groupIt [
	^ GroupsOfIterator new
		groupSize: self;
		yourself
]

{ #category : #'*Iterators' }
Integer >> injectItInto: aBlock [
	^ InjectIntoIterator new
		baseValue: self;
		accumulationBlock: aBlock;
		yourself
]
