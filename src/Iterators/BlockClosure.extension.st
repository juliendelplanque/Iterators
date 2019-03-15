Extension { #name : #BlockClosure }

{ #category : #'*Iterators' }
BlockClosure >> collectIt [
	^ CollectIterator new
			block: self;
			yourself
]

{ #category : #'*Iterators' }
BlockClosure >> doIt [
	^ DoIterator new
			block: self;
			yourself
]

{ #category : #'*Iterators' }
BlockClosure >> selectIt [
	^ SelectIterator new
			block: self;
			yourself
]
