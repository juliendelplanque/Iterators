Extension { #name : #Symbol }

{ #category : #'*Iterators' }
Symbol >> collectIt [
	^ Iterator collectIteratorFor: self
]

{ #category : #'*Iterators' }
Symbol >> detectIt [
	^ Iterator detectIteratorFor: self
]

{ #category : #'*Iterators' }
Symbol >> doIt [
	^ Iterator doIteratorFor: self
]

{ #category : #'*Iterators' }
Symbol >> foldIt [
	^ self reduceIt
]

{ #category : #'*Iterators' }
Symbol >> reduceIt [
	^ [ :object :anotherObject |
		object perform: self with: anotherObject ] reduceIt
]

{ #category : #'*Iterators' }
Symbol >> rejectIt [
	^ Iterator rejectIteratorFor: self
]

{ #category : #'*Iterators' }
Symbol >> selectIt [
	^ Iterator selectIteratorFor: self
]

{ #category : #'*Iterators' }
Symbol >> untilIt [
	^ Iterator untilIteratorFor: self
]
