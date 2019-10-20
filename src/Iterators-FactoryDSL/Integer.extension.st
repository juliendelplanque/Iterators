Extension { #name : #Integer }

{ #category : #'*Iterators-FactoryDSL' }
Integer >> groupsOfIt [
	^ Iterator groupsOfIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
Integer >> limitIt [
	^ Iterator limitIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
Integer >> skipIt [
	^ Iterator skipIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
Integer >> splitOnIt [
	^ Iterator splitOnIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
Integer >> windowIt [
	^ Iterator windowIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
Integer >> windowItStep: step [
	^ Iterator windowIteratorFor: self step: step
]
