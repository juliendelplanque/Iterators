"
I am similar to my superclass but I do the walk in reverse order.
"
Class {
	#name : #ReverseSequentialAccessIterator,
	#superclass : #SequentialAccessIterator,
	#category : #'Iterators-Core'
}

{ #category : #testing }
ReverseSequentialAccessIterator >> hasNext [
	^ currentIndex > 1
]

{ #category : #initialization }
ReverseSequentialAccessIterator >> initializeOn: aSequenceableCollection [
	sequenceableCollection := aSequenceableCollection.
	currentIndex := aSequenceableCollection size + 1
]

{ #category : #private }
ReverseSequentialAccessIterator >> nextIndex [
	^ currentIndex - 1
]
