"
A NeoCSVIteratorTest is a test class for testing the behavior of NeoCSVIterator
"
Class {
	#name : #NeoCSVIteratorTest,
	#superclass : #IteratorTest,
	#category : #'Iterators-NeoCSV-Tests'
}

{ #category : #'iterator creation' }
NeoCSVIteratorTest >> createIteratorOn: anObject [
	^ NeoCSVIterator neoCSVReader: anObject
]

{ #category : #accessing }
NeoCSVIteratorTest >> iteratorWalk [
	^ #(
(1  2  3)
(4  5  6)
(7  8  9)
(10 11 12)
)
]

{ #category : #accessing }
NeoCSVIteratorTest >> objectToWalk [
	^ (NeoCSVReader on: '1,2,3
4,5,6
7,8,9
10,11,12' readStream)
			separator: $,;
			addIntegerField;
			addIntegerField;
			addIntegerField;
			yourself
]
