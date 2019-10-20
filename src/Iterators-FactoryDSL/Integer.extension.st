Extension { #name : #Integer }

{ #category : #'*Iterators-FactoryDSL' }
Integer >> groupsOfIt [
	^ IteratorDecoratorFactory groupsOfIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
Integer >> limitIt [
	^ IteratorDecoratorFactory limitIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
Integer >> skipIt [
	^ IteratorDecoratorFactory skipIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
Integer >> splitOnIt [
	^ IteratorDecoratorFactory splitOnIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
Integer >> windowIt [
	^ IteratorDecoratorFactory windowIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
Integer >> windowItStep: step [
	^ IteratorDecoratorFactory windowIteratorFor: self step: step
]
