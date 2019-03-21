Extension { #name : #Symbol }

{ #category : #'*Iterators' }
Symbol >> collectIt [
	^ CollectIterator new
			block: self;
			yourself
]

{ #category : #'*Iterators' }
Symbol >> doIt [
	^ PreActionIterator new
			block: self;
			yourself
]

{ #category : #'*Iterators' }
Symbol >> rejectIt [
	^ SelectIterator new
			block: [ :object | (self value: object) not ];
			yourself
]

{ #category : #'*Iterators' }
Symbol >> selectIt [
	^ SelectIterator new
			block: self;
			yourself
]
