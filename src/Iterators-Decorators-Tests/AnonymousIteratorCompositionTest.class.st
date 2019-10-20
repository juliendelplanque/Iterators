"
An AnonymousIteratorCompositionTest is a test class for testing the behavior of AnonymousIteratorComposition
"
Class {
	#name : #AnonymousIteratorCompositionTest,
	#superclass : #IteratorDecoratorTest,
	#category : #'Iterators-Decorators-Tests'
}

{ #category : #'iterator creation' }
AnonymousIteratorCompositionTest >> createIteratorOn: anObject [
	^ (AnonymousIteratorComposition block: [ [ :x | x = 2 ] selectIt decoratedBy: 1 limitIt ])
			decorate: anObject
]

{ #category : #accessing }
AnonymousIteratorCompositionTest >> iteratorWalk [
	"Returns the walk that is expected to be done by the iterator under test."
	^ #(2)
]
