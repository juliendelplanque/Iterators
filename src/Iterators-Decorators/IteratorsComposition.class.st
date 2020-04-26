"
I am an iterator that act as a black-box over a composition of iterators decorators.
My aim is to provide a simple way to define a composition of iterators decorators for which the data source iterator can be specified later.

For example, see class-side #example method.
"
Class {
	#name : #IteratorsComposition,
	#superclass : #IteratorDecorator,
	#instVars : [
		'composition'
	],
	#category : #'Iterators-Decorators-Decorators'
}

{ #category : #'instance creation' }
IteratorsComposition class >> composition: iteratorComposition [
	^ self new
		composition: iteratorComposition;
		yourself
]

{ #category : #example }
IteratorsComposition class >> example [
	| composition dataSource |
	composition := IteratorsComposition composition: (#odd selectIt outputTo: [ :x | x * 2 ] collectIt).
	dataSource := (1 to: 10) iterator.

	"Specify the non decorator iterator after creation of decorators composition."
	composition decorate: dataSource.

	"It works as expected."
	composition upToEnd.
]

{ #category : #accessing }
IteratorsComposition >> composition [
	^ composition
]

{ #category : #accessing }
IteratorsComposition >> composition: anObject [
	composition := anObject
]

{ #category : #accessing }
IteratorsComposition >> decoratedIterator [
	^ self iteratorBeforeSourceIterator
		decoratedIterator
]

{ #category : #accessing }
IteratorsComposition >> decoratedIterator: anObject [
	self iteratorBeforeSourceIterator
		decoratedIterator: anObject
]

{ #category : #accessing }
IteratorsComposition >> hasNext [
	^ self composition hasNext
]

{ #category : #private }
IteratorsComposition >> iteratorBeforeSourceIterator [
	^ (self composition decoratedIteratorsIterator
			outputTo: ([ :it | it decoratesDecoratorIterator ] rejectIt)) next
]

{ #category : #accessing }
IteratorsComposition >> maximalUpToEndSize [
	^ self composition maximalUpToEndSize
]

{ #category : #accessing }
IteratorsComposition >> next [
	^ self composition next
]

{ #category : #accessing }
IteratorsComposition >> peek [
	^ self composition peek
]
