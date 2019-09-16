"
I am a wrapper for Generators. See class comment for Generator.

I am instantiated using a block in the same format as used by Generator, I instantiate the Generator, so you do not need to do that beforehand. For example:

GeneratorWrapper generator: [ :gen | 1 to: 10 do: [ :i | gen yield: i ] ]

returns an Iterator on the generator block. In this case a generator returning the numbers 1 to 10. 

Generators  produced using the pipe: method can be used in connection the | and > operators of the iterator class.

"
Class {
	#name : #GeneratorWrapper,
	#superclass : #Iterator,
	#instVars : [
		'wrappedGenerator',
		'peek',
		'hasNext'
	],
	#category : #'Iterators-Wrappers'
}

{ #category : #'instance creation' }
GeneratorWrapper class >> generator: generatorBlock [
	"return an iterator based on the generator block"
	^self new generator: generatorBlock 
]

{ #category : #'instance creation' }
GeneratorWrapper >> generator: generatorBlock [
	wrappedGenerator := Generator on: generatorBlock.
	hasNext := wrappedGenerator atEnd not.
	hasNext ifTrue: [ peek := wrappedGenerator next ]
	
	
]

{ #category : #testing }
GeneratorWrapper >> hasNext [
	^ hasNext
]

{ #category : #accessing }
GeneratorWrapper >> maximalUpToEndSize [
	^ Float infinity
]

{ #category : #accessing }
GeneratorWrapper >> next [
	| next |
	hasNext ifFalse: [ IteratorIsAtEnd signal  ].
	next := peek.
	hasNext := wrappedGenerator atEnd not.
	hasNext ifTrue: [ peek := wrappedGenerator next. ].
	^next
]

{ #category : #accessing }
GeneratorWrapper >> peek [
	hasNext ifFalse: [ IteratorIsAtEnd signal].
	^peek
]
