"
A FlatCollectIteratorTest is a test class for testing the behavior of FlatCollectIterator
"
Class {
	#name : #FlatCollectIteratorTest,
	#superclass : #IteratorDecoratorTest,
	#category : #'Iterators-Decorators-Tests'
}

{ #category : #'iterator creation' }
FlatCollectIteratorTest >> createIteratorOn: anObject [
	^ (IteratorDecoratorFactory flatCollectIteratorFor: [ :x | x * 2 ])
			decorate: anObject;
			yourself
]

{ #category : #accessing }
FlatCollectIteratorTest >> iteratorWalk [
	^ #(2 4 6 8 10 12 14 16 18 20)
]

{ #category : #accessing }
FlatCollectIteratorTest >> objectToWalk [
	^ SequentialAccessIterator on: #((1 2) () (3 4 5) (6 7) (8) (9 10) ())
]

{ #category : #tests }
FlatCollectIteratorTest >> testSelectIteratorBeforeFlatCollectIterator [
	"See issue https://github.com/juliendelplanque/Iterators/issues/31"
	| selectBeforeFlatCollectIterator |
	selectBeforeFlatCollectIterator := ((1 to: 10) iterator
		outputTo: #odd selectIt)
		outputTo: [ :x | { x . x + 1 } ] flatCollectIt.
		
	self assert: (selectBeforeFlatCollectIterator upToEndAs: Array) equals: #(1 2 3 4 5 6 7 8 9 10)
]
