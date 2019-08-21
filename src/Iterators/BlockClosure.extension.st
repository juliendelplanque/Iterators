Extension { #name : #BlockClosure }

{ #category : #'*Iterators' }
BlockClosure >> collectIt [
	^ CollectIterator new
			block: self;
			yourself
]

{ #category : #'*Iterators' }
BlockClosure >> doIt [
	^ PreActionIterator new
			block: self;
			yourself
]

{ #category : #'*Iterators' }
BlockClosure >> foldIt [
	^	self reduceIt
]

{ #category : #'*Iterators' }
BlockClosure >> mergeIt [
	^ IteratorsMerger new
		mergeBlock: self;
		yourself
]

{ #category : #'*Iterators' }
BlockClosure >> reduceIt [
	^ ReduceIterator new
			reduceBlock: self;
			yourself
]

{ #category : #'*Iterators' }
BlockClosure >> rejectIt [
	^ SelectIterator new
			block: [ :object | (self value: object) not ];
			yourself
]

{ #category : #'*Iterators' }
BlockClosure >> selectIt [
	^ SelectIterator new
			block: self;
			yourself
]

{ #category : #'*Iterators' }
BlockClosure >> separateIt [
	^ PreActionIterator new
			conditionBlock: [ :objectsSeenCount | objectsSeenCount > 0 ];
			block: self;
			yourself
]
