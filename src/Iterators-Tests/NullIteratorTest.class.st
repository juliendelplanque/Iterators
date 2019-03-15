"
A NullIteratorTest is a test class for testing the behavior of NullIterator
"
Class {
	#name : #NullIteratorTest,
	#superclass : #IteratorTest,
	#category : #'Iterators-Tests-Core'
}

{ #category : #'iterator creation' }
NullIteratorTest >> createIteratorOn: anObject [
	"We discard the object here since it is not needed."
	^ NullIterator new
]

{ #category : #accessing }
NullIteratorTest >> iteratorWalk [
	"Nothing to be walked."
	^ #()
]

{ #category : #accessing }
NullIteratorTest >> objectToWalk [
	"No object to walk."
	^ nil
]
