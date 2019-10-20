Extension { #name : #BlockClosure }

{ #category : #'*Iterators-FactoryDSL' }
BlockClosure >> collectIt [
	^ Iterator collectIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
BlockClosure >> detectIt [
	^ Iterator detectIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
BlockClosure >> doIt [
	^ Iterator doIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
BlockClosure >> flatCollectIt [
	^ Iterator flatCollectIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
BlockClosure >> foldIt [
	^	self reduceIt
]

{ #category : #'*Iterators-FactoryDSL' }
BlockClosure >> groupedByIt [
	^ Iterator groupedByIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
BlockClosure >> mergeIt [
	^ Iterator mergeIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
BlockClosure >> piecesCutWhereIt [
	^ Iterator piecesCutWhereIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
BlockClosure >> reduceIt [
	^ Iterator reduceIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
BlockClosure >> rejectIt [
	^ Iterator rejectIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
BlockClosure >> selectIt [
	^ Iterator selectIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
BlockClosure >> separateIt [
	^ Iterator separateIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
BlockClosure >> sortIt [
	^ Iterator sortIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
BlockClosure >> splitOnIt [
	^ Iterator splitOnIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
BlockClosure >> untilIt [
	^ Iterator untilIteratorFor: self
]
