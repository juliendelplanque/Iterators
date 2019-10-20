Extension { #name : #SortFunction }

{ #category : #'*Iterators-FactoryDSL' }
SortFunction >> sortIt [
	^ IteratorDecoratorFactory sortIteratorFor: self
]
