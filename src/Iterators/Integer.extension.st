Extension { #name : #Integer }

{ #category : #'*Iterators' }
Integer >> groupIt [
	^ Iterator groupIteratorFor: self
]

{ #category : #'*Iterators' }
Integer >> limitIt [
	^ Iterator limitIteratorFor: self
]

{ #category : #'*Iterators' }
Integer >> skipIt [
	^ Iterator skipIteratorFor: self
]

{ #category : #'*Iterators' }
Integer >> splitOnIt [
	^ Iterator splitOnIteratorFor: self
]

{ #category : #'*Iterators' }
Integer >> windowIt [
	^ Iterator windowIteratorFor: self
]

{ #category : #'*Iterators' }
Integer >> windowItStep: step [
	^ Iterator windowIteratorFor: self step: step
]
