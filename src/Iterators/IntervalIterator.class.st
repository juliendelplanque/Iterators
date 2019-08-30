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
	^ self end - self start
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
