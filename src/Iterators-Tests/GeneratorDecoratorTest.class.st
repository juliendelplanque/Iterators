"
A GeneratorDecoratorTest is a test class for testing the behavior of GeneratorDecorator
"
Class {
	#name : #GeneratorDecoratorTest,
	#superclass : #IteratorDecoratorTest,
	#category : #'Iterators-Tests-Decorators'
}

{ #category : #'iterator creation' }
GeneratorDecoratorTest >> createIteratorOn: anObject [
	"anObject is an 1 to 10 iterator"

	^ (GeneratorDecorator
		pipe: [ :in :gen | [ in atEnd ] whileFalse: [ gen yield: in next * 3 ] ]) decorate: anObject
]

{ #category : #accessing }
GeneratorDecoratorTest >> iteratorWalk [
	"Returns the walk that is expected to be done by the iterator under test."

	^ (1 to: 10) collect: [ :i | i*3 ]
]

{ #category : #tests }
GeneratorDecoratorTest >> testPipingGenerator [
	"Test a generator used in a pipe expression."

	| res |
	res := ((1 to: 15) iterator
		|
			(GeneratorDecorator
				pipe: [ :in :gen | 
					[ in atEnd ]
						whileFalse: [ in peek isPrime
								ifTrue: [ gen yield: in peek ].
							in next ] ])) > Array.
	self assert: res equals: #(2 3 5 7 11 13 )
]
