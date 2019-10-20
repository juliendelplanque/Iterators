Extension { #name : #BlockClosure }

{ #category : #'*Iterators-FactoryDSL' }
BlockClosure >> collectIt [
	^ IteratorDecoratorFactory collectIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
BlockClosure >> detectIt [
	^ IteratorDecoratorFactory detectIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
BlockClosure >> doIt [
	^ IteratorDecoratorFactory doIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
BlockClosure >> flatCollectIt [
	^ IteratorDecoratorFactory flatCollectIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
BlockClosure >> foldIt [
	^	self reduceIt
]

{ #category : #'*Iterators-FactoryDSL' }
BlockClosure >> groupedByIt [
	^ IteratorDecoratorFactory groupedByIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
BlockClosure >> mergeIt [
	^ IteratorDecoratorFactory mergeIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
BlockClosure >> piecesCutWhereIt [
	^ IteratorDecoratorFactory piecesCutWhereIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
BlockClosure >> reduceIt [
	^ IteratorDecoratorFactory reduceIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
BlockClosure >> rejectIt [
	^ IteratorDecoratorFactory rejectIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
BlockClosure >> selectIt [
	^ IteratorDecoratorFactory selectIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
BlockClosure >> separateIt [
	^ IteratorDecoratorFactory separateIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
BlockClosure >> sortIt [
	^ IteratorDecoratorFactory sortIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
BlockClosure >> splitOnIt [
	^ IteratorDecoratorFactory splitOnIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
BlockClosure >> untilIt [
	^ IteratorDecoratorFactory untilIteratorFor: self
]
