Extension { #name : #Object }

{ #category : #'*Iterators-FactoryDSL' }
Object >> injectItInto: aBlock [
	^ IteratorDecoratorFactory injectIntoIteratorForBaseValue: self withBlock: aBlock
]
