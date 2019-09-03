"
An IteratorTest is a test class for testing the behavior of Iterator
"
Class {
	#name : #IteratorTest,
	#superclass : #TestCase,
	#instVars : [
		'iterator'
	],
	#category : #'Iterators-Tests-Core'
}

{ #category : #testing }
IteratorTest class >> isAbstract [
	^ self = IteratorTest
]

{ #category : #'iterator creation' }
IteratorTest >> createIteratorOn: anObject [
	^ self subclassResponsibility
]

{ #category : #accessing }
IteratorTest >> iteratorWalk [
	"Returns the walk that is expected to be done by the iterator under test."
	^ self subclassResponsibility
]

{ #category : #accessing }
IteratorTest >> objectToWalk [
	^ self subclassResponsibility
]

{ #category : #running }
IteratorTest >> setUp [
	super setUp.
	iterator := self createIteratorOn: self objectToWalk
]

{ #category : #tests }
IteratorTest >> testAtEndNext [
	self iteratorWalk size timesRepeat: [ 
		self deny: iterator atEnd.
		iterator next ].
	
	self assert: iterator atEnd
]

{ #category : #tests }
IteratorTest >> testDecoratedBy [
	| decorating decorator |
	decorator := IteratorDecorator new.
	decorating := iterator decoratedBy: decorator.
	
	self assert: decorating equals: decorator.
	self assert: decorating decoratedIterator equals: iterator
]

{ #category : #tests }
IteratorTest >> testDecoratedByDuplicateRemoverIterator [
	iterator := iterator removeDuplicates.
	
	self assert: iterator upToEnd equals: self iteratorWalk asOrderedCollection removeDuplicates asArray
]

{ #category : #tests }
IteratorTest >> testHasNext [
	self iteratorWalk size timesRepeat: [ 
		self assert: iterator hasNext.
		iterator next ].
	
	self deny: iterator hasNext
]

{ #category : #tests }
IteratorTest >> testLast [
	self assert: iterator last equals: self iteratorWalk last.
	
	self should: [ iterator next ] raise: IteratorIsAtEnd
]

{ #category : #tests }
IteratorTest >> testNext [
	self iteratorWalk do: [ :object |
		self assert: iterator next equals: object ].
	
	self should: [ iterator next ] raise: IteratorIsAtEnd
]

{ #category : #test }
IteratorTest >> testOutputTo [
	| decorating decorator |
	decorator := IteratorDecorator new.
	decorating := iterator outputTo: decorator.
	
	self assert: decorating equals: decorator.
	self assert: decorating decoratedIterator equals: iterator
]

{ #category : #tests }
IteratorTest >> testPeek [
	self iteratorWalk do: [ :object |
		self assert: iterator peek equals: object.
		iterator next ].
	
	self should: [ iterator peek ] raise: IteratorIsAtEnd
]

{ #category : #tests }
IteratorTest >> testUpToAs [
	self
		assertCollection: (iterator upTo: (self iteratorWalk size / 2) rounded as: OrderedCollection)
		equals: ((self iteratorWalk copyFrom: 1 to: (self iteratorWalk size / 2) rounded) as: OrderedCollection)
]

{ #category : #tests }
IteratorTest >> testUpToEndAs [
	self
		assertCollection: (iterator upToEndAs: OrderedCollection)
		equals: (self iteratorWalk as: OrderedCollection)
]

{ #category : #tests }
IteratorTest >> testUpToEndInto [
	| colToAdd |
	colToAdd := OrderedCollection new.
	colToAdd add: 1.
	colToAdd add: 2.
	self assert: colToAdd size equals: 2.
	
	iterator upToEndInto: colToAdd.
	
	self
		assertCollection: colToAdd
		equals: (({ 1 . 2 } , self iteratorWalk) as: OrderedCollection)
]

{ #category : #tests }
IteratorTest >> testUpToInto [
	| colToAdd |
	colToAdd := OrderedCollection new.
	colToAdd add: 1.
	colToAdd add: 2.
	self assert: colToAdd size equals: 2.
	
	iterator upTo: (self iteratorWalk size / 2) rounded into: colToAdd.
	
	self
		assertCollection: colToAdd
		equals: (({ 1 . 2 } , (self iteratorWalk copyFrom: 1 to: (self iteratorWalk size / 2) rounded)) as: OrderedCollection)
]

{ #category : #tests }
IteratorTest >> testWithCollectionAPI [
	| withCollectionAPI |
	withCollectionAPI := iterator withCollectionAPI.
	
	self assert: withCollectionAPI class equals: IteratorWithCollectionAPI.
	self assert: withCollectionAPI decoratedIterator equals: iterator
]
