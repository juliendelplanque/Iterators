Extension { #name : #SortFunction }

{ #category : #'*Iterators-FactoryDSL' }
SortFunction >> sortIt [
	^ Iterator sortIteratorFor: self
]
