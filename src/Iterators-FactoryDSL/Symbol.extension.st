Extension { #name : #Symbol }

{ #category : #'*Iterators-FactoryDSL' }
Symbol >> collectIt [
	^ Iterator collectIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
Symbol >> detectIt [
	^ Iterator detectIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
Symbol >> doIt [
	^ Iterator doIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
Symbol >> flatCollectIt [
	^ Iterator flatCollectIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
Symbol >> foldIt [
	^ self reduceIt
]

{ #category : #'*Iterators-FactoryDSL' }
Symbol >> groupedByIt [
	^ Iterator groupedByIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
Symbol >> reduceIt [
	^ [ :object :anotherObject |
		object perform: self with: anotherObject ] reduceIt
]

{ #category : #'*Iterators-FactoryDSL' }
Symbol >> rejectIt [
	^ Iterator rejectIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
Symbol >> selectIt [
	^ Iterator selectIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
Symbol >> untilIt [
	^ Iterator untilIteratorFor: self
]
