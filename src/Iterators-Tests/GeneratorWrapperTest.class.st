"
A GeneratorWrapperTest is a test class for testing the behavior of GeneratorWrapper
"
Class {
	#name : #GeneratorWrapperTest,
	#superclass : #IteratorTest,
	#category : #'Iterators-Tests-Wrappers'
}

{ #category : #'iterator creation' }
GeneratorWrapperTest >> createIteratorOn: aGeneratorBlock [
	"anObject is an 1 to 10 iterator"

	^ (GeneratorWrapper
		generator: aGeneratorBlock) > Array
]

{ #category : #accessing }
GeneratorWrapperTest >> iteratorWalk [
	"Returns the walk that is expected to be done by the iterator under test."

	^ (1 to: 10) collect: [ :i | i * 3 ]
]

{ #category : #accessing }
GeneratorWrapperTest >> objectToWalk [
	^ [:gen | (1 to: 10) do: [:i | gen yield: i*3]]
]

{ #category : #tests }
GeneratorWrapperTest >> testEmptyGenerator [
	"test a generator that yields nothing - should be empty"
	| res |
	res := (GeneratorWrapper generator: [:gen | ]) > Array.
	self assert: res isEmpty 
]

{ #category : #tests }
GeneratorWrapperTest >> testFiveEvenNumbersGenerator [
	"test a generator that does something - here produce 5 elements"
	| res |
	res := (GeneratorWrapper generator: [:gen | 1 to: 5 do:[:i | gen yield: i*2]]) > Array.
	self assert: res equals: #(2 4 6 8 10)
]
