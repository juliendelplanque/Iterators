"
I am a decorator which is defined using a Generator/coroutine.

I am instantiated using GeneratorDecorator pipe: [ :inIterator :generator | ... yield resulting elements by reading the inIterator ].

Generators  produced using the pipe: method can be used in connection the | and > operators of the iterator class.

Notice on implementation:

I use a GeneratorWrapper to actually produce the output stream. To match the intended api I maintain two references to other iterators (in two different instance variables): 

decoratedIterator (from class IteratorDecorator) is the input I draw elements from.
generatorWrapper is the generator I use to actually produce the elements. #hasNext, #next, and #peek methods delegate to this one.
"
Class {
	#name : #GeneratorDecorator,
	#superclass : #IteratorDecorator,
	#traits : 'TIteratorDecoratorWithBlock',
	#classTraits : 'TIteratorDecoratorWithBlock classTrait',
	#instVars : [
		'pipeBlock',
		'genWrapper'
	],
	#category : #'Iterators-Decorators'
}

{ #category : #'instance creation' }
GeneratorDecorator class >> pipe: block [
	"returns an iterator based on the block. See the test for an example."

	^ self new pipe: block
]

{ #category : #accessing }
GeneratorDecorator >> decorate: inputIterator [
	super decorate: inputIterator.
	genWrapper := GeneratorWrapper
		generator: [ :gen | pipeBlock value: inputIterator value: gen ]
]

{ #category : #accessing }
GeneratorDecorator >> hasNext [
	^ genWrapper hasNext
]

{ #category : #accessing }
GeneratorDecorator >> maximalUpToEndSize [
	^ Float infinity
]

{ #category : #accessing }
GeneratorDecorator >> next [
	^ genWrapper next
]

{ #category : #accessing }
GeneratorDecorator >> peek [
	^genWrapper peek
]

{ #category : #'instance creation' }
GeneratorDecorator >> pipe: aBlock [
	pipeBlock := aBlock
]
