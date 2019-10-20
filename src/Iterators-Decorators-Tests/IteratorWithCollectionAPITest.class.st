"
An IteratorWithCollectionAPITest is a test class for testing the behavior of IteratorWithCollectionAPI
"
Class {
	#name : #IteratorWithCollectionAPITest,
	#superclass : #IteratorDecoratorTest,
	#category : #'Iterators-Decorators-Tests'
}

{ #category : #'iterator creation' }
IteratorWithCollectionAPITest >> createIteratorOn: anObject [
	^ IteratorWithCollectionAPI decorate: anObject
]

{ #category : #accessing }
IteratorWithCollectionAPITest >> iteratorWalk [
	"Returns the walk that is expected to be done by the iterator under test."
	^ #(1 2 3 4 5 6 7 8 9 10)
]

{ #category : #tests }
IteratorWithCollectionAPITest >> testAllButFirst [
	self assertCollection: (iterator allButFirst: 1) equals: (self iteratorWalk allButFirst: 1)
]

{ #category : #tests }
IteratorWithCollectionAPITest >> testAllButFirst2 [
	self assertCollection: (iterator allButFirst: 2) equals: (self iteratorWalk allButFirst: 2)
]

{ #category : #tests }
IteratorWithCollectionAPITest >> testAllButFirst3 [
	self assertCollection: (iterator allButFirst: 3) equals: (self iteratorWalk allButFirst: 3).
]

{ #category : #tests }
IteratorWithCollectionAPITest >> testAllButFirst4 [
	self assert: (iterator allButFirst: self iteratorWalk size + 1) equals: #()
]

{ #category : #tests }
IteratorWithCollectionAPITest >> testAllButFirst5 [
	self assertCollection: (iterator allButFirst: self iteratorWalk size) equals: (self iteratorWalk allButFirst: self iteratorWalk size).
]

{ #category : #tests }
IteratorWithCollectionAPITest >> testAllSatisfy [
	self
		assertCollection: (iterator allSatisfy: #odd)
		equals: (self iteratorWalk allSatisfy: #odd)
]

{ #category : #tests }
IteratorWithCollectionAPITest >> testAnySatisfy [
	self
		assertCollection: (iterator anySatisfy: [ :n | n = 9 ])
		equals: (self iteratorWalk anySatisfy: [ :n | n = 9 ])
]

{ #category : #tests }
IteratorWithCollectionAPITest >> testCollect [
	self
		assertCollection: (iterator collect: #squared)
		equals: (self iteratorWalk collect: #squared as: Array)
]

{ #category : #tests }
IteratorWithCollectionAPITest >> testCollectAs [
	self
		assertCollection: (iterator collect: #squared as: Array)
		equals: (self iteratorWalk collect: #squared as: Array)
]

{ #category : #tests }
IteratorWithCollectionAPITest >> testCollectAs2 [
	self
		assertCollection: (iterator collect: #asString as: OrderedCollection)
		equals: (self iteratorWalk collect: #asString as: OrderedCollection)
]

{ #category : #tests }
IteratorWithCollectionAPITest >> testCount [
	self
		assertCollection: (iterator sum: [ :n | n * 2 ])
		equals: (self iteratorWalk sum: [ :n | n * 2 ])
]

{ #category : #tests }
IteratorWithCollectionAPITest >> testDetect [
	self
		assert: (iterator detect: [ :n | n = 3 ])
		equals: (self iteratorWalk detect: [ :n | n = 3 ])
]

{ #category : #tests }
IteratorWithCollectionAPITest >> testDetect2 [
	self
		should: [ iterator detect: [ :n | n = 42 ] ] raise: NotFound.
	self
		should: [ self iteratorWalk detect: [ :n | n = 42 ] ] raise: NotFound
]

{ #category : #tests }
IteratorWithCollectionAPITest >> testDetectIfFound [
	iterator detect: [ :n | n = 2 ] ifFound: [ :found |
		self iteratorWalk detect: [ :n | n = 2 ] ifFound: [ :walkFound |
			self assert: found equals: walkFound.
			^ self ] ].
	
	self fail
]

{ #category : #tests }
IteratorWithCollectionAPITest >> testDetectIfFoundIfNone [
	self
		assert: (iterator detect: [ :n | n = 2 ] ifFound: #yourself ifNone: [ self fail ])
		equals: (self iteratorWalk detect: [ :n | n = 2 ] ifFound: #yourself ifNone: [ self fail ])
]

{ #category : #tests }
IteratorWithCollectionAPITest >> testDetectIfFoundIfNone2 [
	self
		assert: (iterator detect: [ :n | n = 42 ] ifFound: #yourself ifNone: [ 43 ])
		equals: (self iteratorWalk detect: [ :n | n = 42 ] ifFound: #yourself ifNone: [ 43 ])
]

{ #category : #tests }
IteratorWithCollectionAPITest >> testDetectIfNone [
	iterator detect: [ :n | n = 42 ] ifNone: [
		self iteratorWalk detect: [ :n | n = 42 ] ifNone: [ 
			^ self ] ].
	
	self fail
]

{ #category : #tests }
IteratorWithCollectionAPITest >> testDetectMax [
	self
		assert: (iterator detectMax: [ :n | n squared ])
		equals: (self iteratorWalk detectMax: [ :n | n squared ])
]

{ #category : #tests }
IteratorWithCollectionAPITest >> testDetectMin [
	self
		assert: (iterator detectMin: [ :n | n squared ])
		equals: (self iteratorWalk detectMin: [ :n | n squared ])
]

{ #category : #tests }
IteratorWithCollectionAPITest >> testDo [
	|i|
	i := 1.
	iterator do: [ :array |
		self assertCollection: array equals: (self iteratorWalk at: i).
		i := i + 1 ].
]

{ #category : #tests }
IteratorWithCollectionAPITest >> testDoSeparatedBy [
	|i separationsCount|
	i := 1.
	separationsCount := 0.
	iterator do: [ :array |
		self assertCollection: array equals: (self iteratorWalk at: i).
		i := i + 1 ] separatedBy: [ separationsCount := separationsCount + 1 ].
	
	self assert: separationsCount equals: self iteratorWalk size - 1
]

{ #category : #tests }
IteratorWithCollectionAPITest >> testIsEmpty [
	self deny: iterator isEmpty.
	
	self assert: NullIterator new withCollectionAPI isEmpty
]

{ #category : #tests }
IteratorWithCollectionAPITest >> testIsNotEmpty [
	self assert: iterator isNotEmpty.
	
	self deny: NullIterator new withCollectionAPI isNotEmpty
]

{ #category : #tests }
IteratorWithCollectionAPITest >> testReject [
	self
		assertCollection: (iterator reject: [ :n | n odd ])
		equals: ((self iteratorWalk reject: [ :n | n odd ]) as: Array)
]

{ #category : #tests }
IteratorWithCollectionAPITest >> testRejectAs [
	self
		assertCollection: (iterator reject: [ :n | n odd ] as: OrderedCollection)
		equals: ((self iteratorWalk reject: [ :n | n odd ]) as: OrderedCollection)
]

{ #category : #tests }
IteratorWithCollectionAPITest >> testSelect [
	self
		assertCollection: (iterator select: [ :n | n odd ])
		equals: ((self iteratorWalk select: [ :n | n odd ]) as: Array)
]

{ #category : #tests }
IteratorWithCollectionAPITest >> testSelectAs [
	self
		assertCollection: (iterator select: [ :n | n odd ] as: Array)
		equals: ((self iteratorWalk select: [ :n | n odd ]) as: Array)
]

{ #category : #tests }
IteratorWithCollectionAPITest >> testSelectAs2 [
	self
		assertCollection: (iterator select: [ :n | n even ] as: OrderedCollection)
		equals: ((self iteratorWalk select: [ :n | n even ]) as: OrderedCollection)
]

{ #category : #tests }
IteratorWithCollectionAPITest >> testSum [
	self
		assertCollection: (iterator sum: [ :n | n squared ])
		equals: (self iteratorWalk sum: [ :n | n squared ])
]
