"
I am an abstract iterator. I define the minimal API that should be understood by any iterator.

- #next returns the next object resulting of walking one step on the underlaying datastructure.
- #peek returns the object that will be returned by #next next time it is called without actually moving on the underlaying datastructure being walked.
- #hasNext returns true if there is a next object available, else returns false.
"
Class {
	#name : #Iterator,
	#superclass : #Object,
	#category : #'Iterators-Core'
}

{ #category : #testing }
Iterator >> atEnd [
	"Returns true if the iterator can not provide more objects."
	^ self hasNext not
]

{ #category : #private }
Iterator >> checkHasNext [
	self hasNext
		ifFalse: [ self signalAtEnd ].
]

{ #category : #decorating }
Iterator >> decoratedBy: anIteratorDecorator [
	^ anIteratorDecorator
		decoratedIterator: self;
		yourself
]

{ #category : #accessing }
Iterator >> expectedUpToEndSize [
	^ self subclassResponsibility
]

{ #category : #testing }
Iterator >> hasNext [
	^ self subclassResponsibility
]

{ #category : #accessing }
Iterator >> next [
	^ self subclassResponsibility
]

{ #category : #accessing }
Iterator >> peek [
	^ self subclassResponsibility
]

{ #category : #decorating }
Iterator >> removeDuplicates [
	^ self decoratedBy: DuplicateRemoverIterator new
]

{ #category : #decorating }
Iterator >> removeIdentityDuplicates [
	^ self decoratedBy: IdentityDuplicateRemoverIterator new
]

{ #category : #private }
Iterator >> signalAtEnd [
	IteratorIsAtEnd signalIterator: self
]

{ #category : #computing }
Iterator >> upTo: size as: aCollectionClass [
	| actualSize expectedUpToEndSize |
	(aCollectionClass inheritsFrom: SequenceableCollection)
		ifFalse: [ ^ self upTo: size into: aCollectionClass new ].
	
	actualSize := 0.
	size isInfinite
		ifTrue: [
			expectedUpToEndSize := self expectedUpToEndSize.
			expectedUpToEndSize isInfinite ifTrue: [ expectedUpToEndSize := 100 ] ]
		ifFalse: [ expectedUpToEndSize := size ].
	^ aCollectionClass new: expectedUpToEndSize streamContents: [ :stream |
		[ self hasNext and: [ actualSize < size ] ]
			whileTrue: [ 
				stream nextPut: self next.
				actualSize := actualSize + 1 ] ]
]

{ #category : #computing }
Iterator >> upTo: size into: aAddableCollection [
	| actualSize |
	actualSize := 0.
	[ self hasNext and: [ actualSize < size ] ]
		whileTrue: [ 
			aAddableCollection add: self next.
			actualSize := actualSize + 1 ].
	^ aAddableCollection
]

{ #category : #computing }
Iterator >> upToEnd [
	^ self upToEndAs: Array
]

{ #category : #computing }
Iterator >> upToEndAs: aCollectionClass [
	^ self upTo: Float infinity as: aCollectionClass
]

{ #category : #computing }
Iterator >> upToEndDiscardingResult [
	^ self upToEndInto: NullAddableObject
]

{ #category : #computing }
Iterator >> upToEndInto: aAddableCollection [
	^ self upTo: Float infinity into: aAddableCollection
]

{ #category : #decorating }
Iterator >> withCollectionAPI [
	^ self decoratedBy: IteratorWithCollectionAPI new
]
