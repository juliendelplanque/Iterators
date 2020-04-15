"
I am an iterator decorating another iterator.

I am implemented using the decorator design pattern.

My subclasses can define additional behaviour to be done before or after delegating the action to the decorated iterator.

If I am used as is, I just delegate calls to #next, #peek and #hasNext to my #decoratedIterator.
"
Class {
	#name : #IteratorDecorator,
	#superclass : #Iterator,
	#instVars : [
		'decoratedIterator'
	],
	#category : #'Iterators-Decorators-Decorators'
}

{ #category : #'instance creation' }
IteratorDecorator class >> decorate: anIterator [
	^ self new
		decoratedIterator: anIterator;
		yourself
]

{ #category : #iterators }
IteratorDecorator >> dataflowOrderIteratorsIterator [
	^ ReverseLinkedListIterator on: self nextLinkBlock: [ :iterator | iterator decoratedIterator ]
]

{ #category : #accessing }
IteratorDecorator >> decorate: anIterator [
	"To make instance-side and class-side polymorphic."
	self decoratedIterator: anIterator
]

{ #category : #accessing }
IteratorDecorator >> decoratedIterator [
	^ decoratedIterator
]

{ #category : #accessing }
IteratorDecorator >> decoratedIterator: anObject [
	decoratedIterator := anObject
]

{ #category : #iterators }
IteratorDecorator >> decoratedIteratorsIterator [
	^ LinkedListIterator on: self nextLinkBlock: [ :iterator | iterator decoratedIterator ]
]

{ #category : #'results-extraction' }
IteratorDecorator >> extractResultsForIterator: iterator upTo: size [
	"Trick to allow an iterator decorator to be the object that extract results of another iterator.
	 This method is useful when used with DSL that provide a binary message for extracting an
	 iterator's results.
	
	 For example in ShellDSL, with this method, one can write:
	
		#(1 2 3) iterator > [ :x | x ** 2 ] collectIt
	
	 and get as result the following array #(1 4 9)
	"
	^ (iterator outputTo: self) upToEnd
]

{ #category : #testing }
IteratorDecorator >> hasNext [
	^ self decoratedIterator hasNext
]

{ #category : #testing }
IteratorDecorator >> isDecorator [
	^ true
]

{ #category : #accessing }
IteratorDecorator >> maximalUpToEndSize [
	^ self decoratedIterator maximalUpToEndSize
]

{ #category : #accessing }
IteratorDecorator >> next [
	^ self decoratedIterator next
]

{ #category : #accessing }
IteratorDecorator >> peek [
	^ self decoratedIterator peek
]

{ #category : #'input-output' }
IteratorDecorator >> takeAsInput: anIterator [
	^ self decorate: anIterator
]
