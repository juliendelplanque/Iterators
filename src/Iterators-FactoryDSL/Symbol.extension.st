Extension { #name : #Symbol }

{ #category : #'*Iterators-FactoryDSL' }
Symbol >> collectIt [
	^ IteratorDecoratorFactory collectIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
Symbol >> detectIt [
	^ IteratorDecoratorFactory detectIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
Symbol >> doIt [
	^ IteratorDecoratorFactory doIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
Symbol >> flatCollectIt [
	^ IteratorDecoratorFactory flatCollectIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
Symbol >> foldIt [
	^ self reduceIt
]

{ #category : #'*Iterators-FactoryDSL' }
Symbol >> groupedByIt [
	^ IteratorDecoratorFactory groupedByIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
Symbol >> reduceIt [
	^ [ :object :anotherObject |
		object perform: self with: anotherObject ] reduceIt
]

{ #category : #'*Iterators-FactoryDSL' }
Symbol >> rejectIt [
	^ IteratorDecoratorFactory rejectIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
Symbol >> selectIt [
	^ IteratorDecoratorFactory selectIteratorFor: self
]

{ #category : #'*Iterators-FactoryDSL' }
Symbol >> untilIt [
	^ IteratorDecoratorFactory untilIteratorFor: self
]
