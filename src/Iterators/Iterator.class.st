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

{ #category : #accessing }
Iterator >> basicIterator [
	"To be polymorphic with objects providing a basicIterator."
	^ self
]

{ #category : #private }
Iterator >> checkHasNext [
	self hasNext
		ifFalse: [ self signalAtEnd ].
]

{ #category : #accessing }
Iterator >> decoratedIterator [
	"An iterator decorates no other iterator.
	 This method make Iterator and IteratorDecorator polymorphic.
	 Thus it returns nil."
	^ nil
]

{ #category : #testing }
Iterator >> hasNext [
	^ self subclassResponsibility
]

{ #category : #testing }
Iterator >> isDecorator [
	^ false
]

{ #category : #accessing }
Iterator >> iterator [
	"To be polymorphic with objects providing an iterator."
	^ self withCollectionAPI
]

{ #category : #accessing }
Iterator >> last [
	^ (self decoratedBy: [ :x :y | y ] foldIt) next 
]

{ #category : #accessing }
Iterator >> maximalUpToEndSize [
	"This method is used as the size of the collection to create when the iterators are run.
	 Subclasses might override it if they know the expected size of the resulting collection.
	 A good example of the usage of this method is the LimitIterator. Since this iterator limits
	 the number of incoming objects to N (with N specified by the user),
	 LimitIterator>>#maximalUpToEndSize returns N.
	"
	^ 100
]

{ #category : #accessing }
Iterator >> next [
	^ self subclassResponsibility
]

{ #category : #'input-output' }
Iterator >> outputTo: anIteratorDecorator [
	^ anIteratorDecorator decorate: self
]

{ #category : #accessing }
Iterator >> peek [
	^ self subclassResponsibility
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
	expectedUpToEndSize := size isInfinite
		ifTrue: [ self maximalUpToEndSize ]
		ifFalse: [ size ].
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
