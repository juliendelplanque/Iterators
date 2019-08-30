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
