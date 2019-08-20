Extension { #name : #Object }

{ #category : #'*Iterators' }
Object >> injectItInto: aBlock [
	^ InjectIntoIterator new
		baseValue: self;
		accumulationBlock: aBlock;
		yourself
]
