Extension { #name : #BlockClosure }

{ #category : #'*Iterators' }
BlockClosure >> collectIt [
	^ Iterator collectIteratorFor: self
]

{ #category : #'*Iterators' }
BlockClosure >> doIt [
	^ Iterator doIteratorFor: self
]

{ #category : #'*Iterators' }
BlockClosure >> foldIt [
	^	self reduceIt
]

{ #category : #'*Iterators' }
BlockClosure >> mergeIt [
	^ Iterator mergeIteratorFor: self
]

{ #category : #'*Iterators' }
BlockClosure >> reduceIt [
	^ Iterator reduceIteratorFor: self
]

{ #category : #'*Iterators' }
BlockClosure >> rejectIt [
	^ Iterator rejectIteratorFor: self
]

{ #category : #'*Iterators' }
BlockClosure >> selectIt [
	^ Iterator selectIteratorFor: self
]

{ #category : #'*Iterators' }
BlockClosure >> separateIt [
	^ Iterator separateIteratorFor: self
]
