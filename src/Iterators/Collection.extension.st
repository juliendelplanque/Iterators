Extension { #name : #Collection }

{ #category : #'*Iterators' }
Collection >> decorate: anIterator [
	^ anIterator upToEndInto: self
]

{ #category : #'*Iterators' }
Collection class >> decorate: anIterator [
	^ anIterator upToEndAs: self
]
