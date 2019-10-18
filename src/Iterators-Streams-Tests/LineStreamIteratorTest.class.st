"
A LineStreamIteratorTest is a test class for testing the behavior of LineStreamIterator
"
Class {
	#name : #LineStreamIteratorTest,
	#superclass : #IteratorTest,
	#instVars : [
		'fileMock',
		'fileMockReadStream'
	],
	#category : #'Iterators-Streams-Tests'
}

{ #category : #'iterator creation' }
LineStreamIteratorTest >> createIteratorOn: anObject [
	^ LineStreamIterator new
		stream: anObject;
		yourself
]

{ #category : #accessing }
LineStreamIteratorTest >> iteratorWalk [
	^ #('line1' 'line2' 'line3' 'line4' 'line5' 'line6')
]

{ #category : #accessing }
LineStreamIteratorTest >> objectToWalk [
	^ fileMockReadStream
]

{ #category : #running }
LineStreamIteratorTest >> setUp [
	fileMock := (FileSystem memory / 'fakefile.txt')
						writeStreamDo: [ :stream | stream nextPutAll: 'line1
line2
line3
line4
line5
line6' ];
						yourself.
						
	fileMockReadStream := fileMock readStream.
	super setUp.
]

{ #category : #running }
LineStreamIteratorTest >> tearDown [
	fileMockReadStream close.
	super tearDown
]
