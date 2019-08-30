Trait {
	#name : #TIteratorDecoratorWithBlock,
	#instVars : [
		'block'
	],
	#category : #'Iterators-Traits'
}

{ #category : #'instance creation' }
TIteratorDecoratorWithBlock classSide >> block: aBlock [
	^ self new
		block: aBlock;
		yourself
]

{ #category : #accessing }
TIteratorDecoratorWithBlock >> block [
	^ block
]

{ #category : #accessing }
TIteratorDecoratorWithBlock >> block: anObject [
	block := anObject
]

{ #category : #printing }
TIteratorDecoratorWithBlock >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	self block printOn: aStream.
	aStream nextPut: $).
]
