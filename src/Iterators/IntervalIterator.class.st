"
I am an iterator for an interval between two integer (#start and #end).
"
Class {
	#name : #IntervalIterator,
	#superclass : #Iterator,
	#instVars : [
		'start',
		'end',
		'current'
	],
	#category : #'Iterators-Core'
}

{ #category : #'instance creation' }
IntervalIterator class >> start: start [
	"Create an interval iterator from [start; +infinity["
	^ self start: start end: Float infinity
]

{ #category : #'instance creation' }
IntervalIterator class >> start: start end: end [
	"Create an interval iterator from [start; end]"
	^ self new
		start: start;
		end: end;
		yourself
]

{ #category : #accessing }
IntervalIterator >> end [
	^ end
]

{ #category : #accessing }
IntervalIterator >> end: anObject [
	end := anObject
]

{ #category : #testing }
IntervalIterator >> hasNext [
	^ current <= (self end - self start)
]

{ #category : #initialization }
IntervalIterator >> initialize [
	super initialize.
	current := 0
]

{ #category : #accessing }
IntervalIterator >> maximalUpToEndSize [
	^ self end isInfinite
		ifTrue: [ super maximalUpToEndSize ]
		ifFalse: [ self end - self start ]
]

{ #category : #accessing }
IntervalIterator >> next [
	self checkHasNext.
	current := current + 1.
	^ start + current - 1
]

{ #category : #accessing }
IntervalIterator >> peek [
	self checkHasNext.
	^ start + current
]

{ #category : #accessing }
IntervalIterator >> start [
	^ start
]

{ #category : #accessing }
IntervalIterator >> start: anObject [
	start := anObject
]
