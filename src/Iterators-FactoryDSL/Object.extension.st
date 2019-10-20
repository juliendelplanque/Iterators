Extension { #name : #Object }

{ #category : #'*Iterators-FactoryDSL' }
Object >> injectItInto: aBlock [
	^ InjectIntoIterator new
		baseValue: self;
		block: aBlock;
		yourself
]
