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

{ #category : #private }
Iterator >> signalAtEnd [
	IteratorIsAtEnd signalIterator: self
]

{ #category : #computing }
Iterator >> upTo: size as: aCollectionClass [
	| actualSize collection |
	actualSize := 0.
	(aCollectionClass inheritsFrom: SequenceableCollection)
		ifTrue: [ 
			^ aCollectionClass streamContents: [ :stream |
				[ self hasNext and: [ actualSize < size ] ]
					whileTrue: [ 
						stream nextPut: self next.
						actualSize := actualSize + 1 ] ] ].
	
	collection := aCollectionClass new.
	[ self hasNext and: [ actualSize < size ] ]
		whileTrue: [ 
			collection add: self next.
			actualSize := actualSize + 1 ].
	^ collection
]

{ #category : #computing }
Iterator >> upToEnd [
	^ self upToEndAs: Array
]

{ #category : #computing }
Iterator >> upToEndAs: aCollectionClass [
	^ self upTo: Float infinity as: aCollectionClass
]

{ #category : #decorating }
Iterator >> withCollectionAPI [
	^ self decoratedBy: IteratorWithCollectionAPI new
]

{ #category : #decorating }
Iterator >> | anIteratorDecorator [
	^ self decoratedBy: anIteratorDecorator
]
