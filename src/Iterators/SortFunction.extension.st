Extension { #name : #SortFunction }

{ #category : #'*Iterators' }
SortFunction >> sortIt [
	^ Iterator sortIteratorFor: self
]
